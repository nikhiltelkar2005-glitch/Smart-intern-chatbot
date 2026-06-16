# 🤖 TekoraAI Intern Assistant Chatbot

> An enterprise-grade AI-powered chatbot for automating internship management at **TekoraAI**.

[![Live Demo](https://img.shields.io/badge/Live%20Demo-Vercel-black?style=flat-square&logo=vercel)](https://smart-intern-chatbot.vercel.app)
[![Backend](https://img.shields.io/badge/Backend-Railway-blueviolet?style=flat-square&logo=railway)](https://smart-intern-chatbot-production.up.railway.app)
[![Python](https://img.shields.io/badge/Python-FastAPI-green?style=flat-square&logo=python)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/Frontend-React%20%2B%20Vite-blue?style=flat-square&logo=react)](https://react.dev/)
[![AI](https://img.shields.io/badge/AI-Google%20Dialogflow-orange?style=flat-square&logo=google)](https://dialogflow.cloud.google.com/)

---

## ✨ Features

- 🧠 **AI Conversations** — Powered by Google Dialogflow for natural language understanding
- 💾 **Auto Database Storage** — Every conversation is automatically saved to MySQL in real time
- 📧 **Email Notifications** — Automated emails sent to the company via Resend API on new applications
- 🔗 **Smart Link Detection** — Phone numbers, emails, and URLs are auto-detected and made clickable
- 💅 **Premium Glassmorphism UI** — Animated floating chat widget with dark purple theme
- 🌐 **Fully Deployed** — Live on Vercel (frontend) + Railway (backend + database)
- 🔄 **Auto CI/CD** — Every GitHub push auto-deploys the full stack

---

## 🏗️ Architecture

```
User (Browser)
    ↓
React Widget (Vercel)
    ↓ POST /chat
Python FastAPI (Railway)
    ↓
Google Dialogflow AI
    ↓
Python Backend
    ├── MySQL Database (Railway)
    └── Resend API → Company Email Inbox
```

---

## 🛠️ Technology Stack

| Layer | Technology |
|---|---|
| Frontend | React.js + Vite |
| Frontend Hosting | Vercel |
| Backend | Python + FastAPI |
| Backend Hosting | Railway |
| AI Engine | Google Dialogflow |
| Database | MySQL |
| Database Hosting | Railway MySQL |
| Email Delivery | Resend API |
| Version Control | GitHub |

---

## 🤖 Chatbot Intents (9 Total)

| # | Intent | Data Saved |
|---|---|---|
| 1 | Leave Application | `leave_applications` |
| 2 | Tools Access Request | `tool_access_requests` |
| 3 | Certificate Information | `certificate_requests` |
| 4 | Internship Extension | `extension_requests` |
| 5 | Performance Review Request | `performance_reviews` |
| 6 | Application Process | `intern_registration` |
| 7 | Offer Letter & Documents | `offer_letter_requests` |
| 8 | Recommendation Request | `recommendation_requests` |
| 9 | Internship Application *(New)* | `intern_registration` + **email sent** |

---

## 🚀 Getting Started (Local Development)

### Prerequisites
- Python 3.10+
- Node.js 18+
- MySQL (local)
- Google Dialogflow credentials (`credentials.json`)

### 1. Clone the Repository
```bash
git clone https://github.com/nikhiltelkar2005-glitch/Smart-intern-chatbot.git
cd Smart-intern-chatbot
```

### 2. Set Up the Backend
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Create a `.env` file in the root:
```env
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
DIALOGFLOW_PROJECT_ID=your_project_id

DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=tekoraai_chatbot

RESEND_API_KEY=your_resend_api_key
EMAIL_RECEIVER=your_email@gmail.com
```

Run the backend:
```bash
uvicorn main:app --reload
```

### 3. Set Up the Frontend
```bash
cd chat-ui-react
npm install
```

Create `chat-ui-react/.env.local`:
```env
VITE_API_URL=http://localhost:8000
```

Run the frontend:
```bash
npm run dev
```

---

## 🌐 Deployment

### Backend → Railway
1. Push to GitHub — Railway auto-deploys.
2. Set all environment variables in the Railway **Variables** tab.

### Frontend → Vercel
1. Push to GitHub — Vercel auto-deploys.
2. Set `VITE_API_URL` in Vercel environment variables.

---

## 📧 Email Notification System

When a user completes an internship application through the chatbot, the backend:
1. Saves all data to the MySQL `intern_registration` table.
2. Fires an async background task to send an email via the **Resend API**.
3. The email lands in the company inbox with the applicant's info and a `Reply-To` pointing directly to their email address.

> **Note:** On Resend's free tier, you can only send to the email address you registered with. To send to any address, verify your domain at [resend.com/domains](https://resend.com/domains).

---

## 📁 Project Structure

```
tekoraai-chatbot/
├── main.py                  # FastAPI backend — core logic
├── requirements.txt         # Python dependencies
├── Procfile                 # Railway start command
├── credentials.json         # Google service account (gitignored)
├── .env                     # Local environment variables (gitignored)
├── database.sql             # MySQL schema
└── chat-ui-react/           # React frontend
    ├── src/
    │   ├── App.jsx
    │   └── components/
    │       ├── ChatWidget.jsx   # Main chat component
    │       └── ChatWidget.css   # Premium UI styling
    └── package.json
```

---

## 👨‍💻 Author

**Nikhil Telkar**  
Intern @ TekoraAI  
📧 nikhiltelkar19@gmail.com

---

## 📄 License

This project was built as part of an internship at **TekoraAI**. All rights reserved.
