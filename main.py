from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import google.cloud.dialogflow as dialogflow
from google.protobuf.json_format import MessageToDict
import mysql.connector
import os
import uuid
from dotenv import load_dotenv

load_dotenv()

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

class MessageRequest(BaseModel):
    message: str
    session_id: str = None

def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_NAME")
    )

def get_str(params, *keys):
    """Helper: get first matching key from params, handle list or string."""
    for key in keys:
        val = params.get(key)
        if val:
            if isinstance(val, list) and len(val) > 0:
                return str(val[0])
            return str(val)
    return 'Unknown'

def get_date(params, *keys):
    """Helper: extract a clean YYYY-MM-DD date from Dialogflow date params."""
    for key in keys:
        val = params.get(key)
        if val:
            item = val[0] if isinstance(val, list) and len(val) > 0 else val
            if isinstance(item, dict) and 'date_time' in item:
                return item['date_time'].split('T')[0]
            if isinstance(item, str) and 'T' in item:
                return item.split('T')[0]
            return str(item)
    return None

def db_insert(table, columns, values):
    """Helper: open DB connection, insert a row, close connection."""
    conn = get_db_connection()
    cursor = conn.cursor()
    cols = ', '.join(columns)
    placeholders = ', '.join(['%s'] * len(values))
    cursor.execute(f"INSERT INTO {table} ({cols}) VALUES ({placeholders})", values)
    conn.commit()
    cursor.close()
    conn.close()

@app.get("/")
def root():
    return {"status": "TekoraAI Chatbot is running"}

@app.post("/chat")
def chat(request: MessageRequest):
    project_id = os.getenv("DIALOGFLOW_PROJECT_ID")
    session_id = request.session_id or str(uuid.uuid4())

    session_client = dialogflow.SessionsClient()
    session = session_client.session_path(project_id, session_id)

    text_input = dialogflow.TextInput(text=request.message, language_code="en")
    query_input = dialogflow.QueryInput(text=text_input)

    response = session_client.detect_intent(
        request={"session": session, "query_input": query_input}
    )

    intent_name = response.query_result.intent.display_name
    all_params_present = response.query_result.all_required_params_present

    print(f"\n{'='*40}")
    print(f"✉️  INTENT: '{intent_name}' | ALL PARAMS: {all_params_present}")
    print(f"{'='*40}\n")

    # Only extract params when all required ones are filled
    if all_params_present:
        try:
            response_dict = MessageToDict(response._pb)
            params = response_dict.get('queryResult', {}).get('parameters', {})
            print(f"📦 PARAMS: {params}")

            # ─── 1. LEAVE APPLICATION ───────────────────────────────
            if intent_name == 'Leave Application intent':
                name = get_str(params, 'intern-name', 'intern_name')
                reason = get_str(params, 'LeaveReason', 'leave_reason', 'leave-reason')
                date = get_date(params, 'leave-date', 'leave_date')
                if date:
                    db_insert('leave_applications',
                              ['intern_name', 'leave_date', 'leave_reason'],
                              (name, date, reason))
                    print(f"✅ SAVED: Leave for {name} on {date}")
                else:
                    print("⚠️  Could not parse leave date, skipping DB insert.")

            # ─── 2. TOOL ACCESS REQUEST ─────────────────────────────
            elif intent_name == 'Tools Access Request':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                tool = get_str(params, 'ToolName', 'tool-name', 'tool_name')
                db_insert('tool_access_requests',
                          ['intern_name', 'intern_email', 'tool_name'],
                          (name, email, tool))
                print(f"✅ SAVED: Tool request ({tool}) for {name}")

            # ─── 3. CERTIFICATE REQUEST ─────────────────────────────
            elif intent_name == 'Certificate Information':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                db_insert('certificate_requests',
                          ['intern_name', 'intern_email'],
                          (name, email))
                print(f"✅ SAVED: Certificate request for {name}")

            # ─── 4. INTERNSHIP EXTENSION ────────────────────────────
            elif intent_name == 'Internship Extension':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                duration = get_str(params, 'extension-duration', 'duration', 'extension_duration')
                db_insert('extension_requests',
                          ['intern_name', 'intern_email', 'extension_duration'],
                          (name, email, duration))
                print(f"✅ SAVED: Extension request ({duration}) for {name}")

            # ─── 5. PERFORMANCE REVIEW ──────────────────────────────
            elif intent_name == 'Performance Review Request':
                name = get_str(params, 'intern-name', 'intern_name')
                period = get_str(params, 'evaluation-period', 'evaluation_period', 'period', 'month')

                def to_int(params, *keys):
                    val = get_str(params, *keys)
                    try:
                        return int(float(val))
                    except (ValueError, TypeError):
                        return 0

                project_quality = to_int(params, 'project-quality', 'project_quality', 'project')
                attendance = to_int(params, 'attendance', 'Attendance')
                communication = to_int(params, 'communication', 'Communication')
                overall_rating = to_int(params, 'overall-rating', 'overall_rating', 'rating', 'Rating')

                db_insert('performance_reviews',
                          ['intern_name', 'evaluation_period', 'project_quality', 'attendance', 'communication', 'overall_rating'],
                          (name, period, project_quality, attendance, communication, overall_rating))
                print(f"✅ SAVED: Performance Review for {name} (Period: {period}, Overall: {overall_rating})")

            # ─── 6. INTERN REGISTRATION ─────────────────────────────
            elif intent_name == 'Application Process':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                education = get_str(params, 'education', 'education_level', 'educationLevel')
                domain = get_str(params, 'domain', 'Domain')
                phone = get_str(params, 'phone', 'Phone', 'phone_number')
                db_insert('intern_registration',
                          ['intern_name', 'intern_email', 'education_level', 'domain', 'phone'],
                          (name, email, education, domain, phone))
                print(f"✅ SAVED: Registration for {name}")

            # ─── 7. OFFER LETTER REQUEST ────────────────────────────
            elif intent_name == 'Offer Letter & Documents':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                db_insert('offer_letter_requests',
                          ['intern_name', 'intern_email'],
                          (name, email))
                print(f"✅ SAVED: Offer letter request for {name}")

            # ─── 8. RECOMMENDATION LETTER ───────────────────────────
            elif intent_name == 'Recommendation Request':
                name = get_str(params, 'intern-name', 'intern_name')
                email = get_str(params, 'intern-email', 'email')
                rec_type = get_str(params, 'recommendation-type', 'recommendationType', 'type')
                db_insert('recommendation_requests',
                          ['intern_name', 'intern_email', 'recommendation_type'],
                          (name, email, rec_type))
                print(f"✅ SAVED: Recommendation request ({rec_type}) for {name}")

        except Exception as e:
            print(f"❌ ERROR saving to DB: {e}")

    return {
        "reply": response.query_result.fulfillment_text,
        "intent": intent_name,
        "session_id": session_id
    }



@app.get("/faq")
def get_faq():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT topic, question, answer FROM faq")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return {"faq": results}
