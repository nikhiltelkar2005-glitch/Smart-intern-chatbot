# TekoraAI Internship Chatbot 🤖

A full-stack AI-powered chatbot built for **TekoraAI** using Google Dialogflow, FastAPI (Python), MySQL, and React (Vite). The UI is fully responsive and features a modern glassmorphism design that works seamlessly on both desktop and mobile phones.

---

## 🏗️ Architecture

```
tekoraai-chatbot/
├── main.py              ← FastAPI Python backend (Handles Dialogflow & MySQL)
├── chat-ui-react/       ← React + Vite frontend (Modern Chat UI)
├── database.sql         ← Pre-configured database tables & FAQ data
├── .env                 ← 🔒 Secret config (You must create this!)
└── credentials.json     ← 🔒 Google Dialogflow key (Get from Nikhil!)
```

---

## ⚙️ Prerequisites

Before you start, make sure you have these installed on your laptop:

- **Python 3.10+** → [Download here](https://python.org)
- **Node.js 18+** → [Download here](https://nodejs.org)
- **MySQL Server** → [Download here](https://dev.mysql.com/downloads/installer/) (Make sure you know your root password!)

---

## 🚀 Setup Steps (Follow these exactly)

### Step 1 — Clone the repo
Open your terminal and run:
```bash
git clone https://github.com/YOUR_USERNAME/tekoraai-chatbot.git
cd tekoraai-chatbot
```

### Step 2 — Get the Secret Files from Nikhil
Because this project uses secure Google Cloud APIs and local databases, there are 2 things that are NOT on GitHub. **You must ask Nikhil for these:**
1. The **`credentials.json`** file. Put this directly inside the `tekoraai-chatbot/` folder.
2. The **Dialogflow Project ID**.

### Step 3 — Create your `.env` file
Create a new file named `.env` right next to `main.py` and paste this inside. **Important: Change `YOUR_MYSQL_PASSWORD` to your actual MySQL password!**
```env
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=tekoraai_chatbot
DIALOGFLOW_PROJECT_ID=paste_the_project_id_from_nikhil_here
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
```

### Step 4 — Set up the MySQL Database
We have provided a `database.sql` file that instantly creates all 10 tables and imports the 38 FAQ questions! Run these commands in your terminal:

```bash
# 1. Log into MySQL (type your password when prompted)
mysql -u root -p

# 2. Inside MySQL, create the database:
CREATE DATABASE tekoraai_chatbot;
EXIT;

# 3. Back in your normal terminal, import the tables and data!
mysql -u root -p tekoraai_chatbot < database.sql
```

### Step 5 — Set up the Python Backend
Open a terminal inside the `tekoraai-chatbot/` folder:
```bash
# Create virtual environment
python3 -m venv venv

# Activate it (Mac/Linux)
source venv/bin/activate
# (On Windows use: venv\Scripts\activate)

# Install required packages
pip install fastapi uvicorn mysql-connector-python google-cloud-dialogflow python-dotenv

# Start the server!
uvicorn main:app --reload
```
✅ You should see it running at `http://localhost:8000`

### Step 6 — Set up the React Frontend
Open a **brand new terminal tab**, and run:
```bash
cd chat-ui-react
npm install
npm run dev
```
✅ The website is now running at `http://localhost:5173`

---

## 💬 How to Use the Chatbot

1. Open `http://localhost:5173` in your browser.
2. Click the purple chat bubble in the bottom right corner.
3. Talk to the bot! It will automatically save your answers to the database. Try asking:
   - "I want to apply for leave"
   - "I need access to Slack"
   - "I want a certificate"
   - "I want to register for the internship"
   - "Can I get a performance review?"

---

## 🗄️ Database Tables mapping

When you chat, the Python backend automatically detects your intent and saves the data to these tables:

| Table | Dialogflow Intent | What it stores |
|---|---|---|
| `faq` | *(Automated matching)* | The 38 FAQ questions & answers (Read-only knowledge base) |
| `leave_applications` | `Leave Application intent` | Leave requests with dates and reasons |
| `tool_access_requests` | `Tools Access Request` | Software tool requests (Slack, Jira, etc.) |
| `certificate_requests` | `Certificate Information` | Requests for completion certificates |
| `extension_requests` | `Internship Extension` | Requests to extend internship duration |
| `performance_reviews` | `Performance Review Request` | Monthly performance evaluations |
| `intern_registration` | `Application Process` | New intern registrations |
| `offer_letter_requests` | `Offer Letter & Documents` | Requests for official offer letters |
| `recommendation_requests` | `Recommendation Request` | Requests for letters of recommendation |
| `feedback` | *(Reserved)* | General feedback from interns |

---

## 👨‍💻 Built By
**Nikhil Telkar** — Business Analyst Intern @ TekoraAI
