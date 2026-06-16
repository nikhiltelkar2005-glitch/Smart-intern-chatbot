# 🤖 Smart Intern Assistant Chatbot

> An enterprise-grade, AI-powered chatbot for automating internship management — built with React, Python FastAPI, Google Dialogflow, and MySQL.

[![Live Demo](https://img.shields.io/badge/Live%20Demo-Vercel-black?style=flat-square&logo=vercel)](https://smart-intern-chatbot.vercel.app)
[![Backend](https://img.shields.io/badge/Backend-Railway-blueviolet?style=flat-square&logo=railway)](https://smart-intern-chatbot-production.up.railway.app)
[![Python](https://img.shields.io/badge/Python-FastAPI-green?style=flat-square&logo=python)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/Frontend-React%20%2B%20Vite-blue?style=flat-square&logo=react)](https://react.dev/)
[![AI](https://img.shields.io/badge/AI-Google%20Dialogflow-orange?style=flat-square&logo=google)](https://dialogflow.cloud.google.com/)

---

## 📌 What Does This Do?

This chatbot sits as a floating widget on any website. Visitors can:

- Ask questions about internship programs, eligibility, policies, stipends, etc.
- Submit internship applications directly through the chat
- Request leave, certificates, offer letters, recommendation letters, and more

Every conversation is **saved to a MySQL database** automatically, and the company receives an **instant email notification** for every new internship application.

---

## ✨ Features

- 🧠 **AI-Powered** — Google Dialogflow handles all natural language understanding
- 💾 **Auto Database Storage** — All data is instantly saved to MySQL tables
- 📧 **Email Notifications** — Automated alerts sent via Resend API on new applications
- 🔗 **Smart Link Detection** — Phone numbers, emails, and URLs are auto-clickable
- 💅 **Premium Glassmorphism UI** — Animated floating widget with dark purple theme
- 🌐 **Fully Deployed** — Frontend on Vercel, Backend + DB on Railway
- 🔄 **Auto CI/CD** — Every `git push` deploys the full stack automatically

---

## 🏗️ Architecture

```
User (Browser)
    ↓ types a message
React Widget (Vercel)
    ↓ POST /chat
Python FastAPI Backend (Railway)
    ↓
Google Dialogflow AI  ← detects intent + extracts parameters
    ↓
Python Backend
    ├── Saves data → MySQL Database (Railway)
    └── Sends notification → Resend API → Company Email Inbox
    ↓
Response sent back to React → Displayed to user
```

---

## 🛠️ Tech Stack

| Layer            | Technology        |
| ---------------- | ----------------- |
| Frontend         | React.js + Vite   |
| Frontend Hosting | Vercel            |
| Backend          | Python + FastAPI  |
| Backend Hosting  | Railway           |
| AI Engine        | Google Dialogflow |
| Database         | MySQL             |
| Database Hosting | Railway MySQL     |
| Email Delivery   | Resend API        |
| Version Control  | GitHub            |

---

## 🤖 Supported Intents (9 Total)

| #   | Intent                     | Database Table                        |
| --- | -------------------------- | ------------------------------------- |
| 1   | Leave Application          | `leave_applications`                  |
| 2   | Tools Access Request       | `tool_access_requests`                |
| 3   | Certificate Request        | `certificate_requests`                |
| 4   | Internship Extension       | `extension_requests`                  |
| 5   | Performance Review         | `performance_reviews`                 |
| 6   | Application Process        | `intern_registration`                 |
| 7   | Offer Letter Request       | `offer_letter_requests`               |
| 8   | Recommendation Request     | `recommendation_requests`             |
| 9   | New Internship Application | `intern_registration` + 📧 email sent |

---

## 🚀 Local Setup Guide

Follow these steps to run the project locally on your machine.

### Prerequisites

Before you begin, make sure you have:

- **Python 3.10+** installed
- **Node.js 18+** installed
- **MySQL** running locally
- A **Google Dialogflow** project and its `credentials.json` service account key
- A free **Resend** account at [resend.com](https://resend.com)

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/nikhiltelkar2005-glitch/Smart-intern-chatbot.git
cd Smart-intern-chatbot
```

---

### Step 2 — Set Up the Backend (Python)

**Create and activate a virtual environment:**

```bash
python3 -m venv venv
source venv/bin/activate       # On Windows: venv\Scripts\activate
```

**Install dependencies:**

```bash
pip install -r requirements.txt
```

**Create a `.env` file in the root folder:**

```env
# Google Dialogflow
GOOGLE_APPLICATION_CREDENTIALS=credentials.json
DIALOGFLOW_PROJECT_ID=your_dialogflow_project_id

# MySQL Database
DB_HOST=127.0.0.1
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=your_database_name

# Email (Resend API)
RESEND_API_KEY=re_your_resend_api_key
EMAIL_RECEIVER=your_email@gmail.com
```

> ⚠️ Place your `credentials.json` Google service account file in the root folder.

**Start the backend server:**

```bash
uvicorn main:app --reload
```

The API will be live at `http://localhost:8000`

---

### Step 3 — Set Up the Frontend (React)

```bash
cd chat-ui-react
npm install
```

**Create a `.env.local` file inside `chat-ui-react/`:**

```env
VITE_API_URL=http://localhost:8000
```

**Start the frontend:**

```bash
npm run dev
```

The chat widget will be live at `http://localhost:5173`

---

### Step 4 — Set Up the Database

Import the schema into your local MySQL:

```bash
mysql -u root -p your_database_name < database.sql
```

---

## 🌐 Production Deployment

### Backend → Railway

1. Push your code to GitHub.
2. Create a new project on [railway.app](https://railway.app) and link your GitHub repo.
3. Add a **MySQL** plugin inside Railway.
4. Go to the **Variables** tab and add all environment variables from your `.env` file.
5. Railway auto-deploys on every `git push`.

### Frontend → Vercel

1. Go to [vercel.com](https://vercel.com) and import your GitHub repo.
2. Set the **Root Directory** to `chat-ui-react`.
3. Add `VITE_API_URL` as an environment variable, pointing to your Railway backend URL.
4. Vercel auto-deploys on every `git push`.

---

## 📧 How the Email Notification Works

On Resend's **free tier**, you can only send emails to the exact email address you registered with. To send to any address (e.g. a company email), you must verify your domain at [resend.com/domains](https://resend.com/domains).

The email arrives in your inbox formatted like this:

```
Subject: New Internship Application: [Applicant Name]

Name: ...
Email: ...
Phone: ...
Inquiry Type: ...
Details: ...
```

Clicking **Reply** in your email client will automatically address the reply to the applicant.

---

## 📁 Project Structure

```
Smart-intern-chatbot/
├── main.py                     # FastAPI backend — core logic & all intents
├── requirements.txt            # Python dependencies
├── Procfile                    # Railway/Heroku process file
├── database.sql                # Full MySQL schema
├── credentials.json            # Google service account key (gitignored)
├── .env                        # Local environment variables (gitignored)
│
└── chat-ui-react/              # React frontend
    ├── src/
    │   ├── App.jsx             # Root component
    │   └── components/
    │       ├── ChatWidget.jsx  # Main chat logic & UI
    │       └── ChatWidget.css  # Premium dark glassmorphism styling
    └── package.json
```

---

## 🔑 Environment Variables Reference

| Variable                      | Where   | Description                             |
| ----------------------------- | ------- | --------------------------------------- |
| `DIALOGFLOW_PROJECT_ID`       | Railway | Your Dialogflow project ID              |
| `DIALOGFLOW_CREDENTIALS_JSON` | Railway | Full contents of credentials.json       |
| `DB_HOST`                     | Railway | MySQL host address                      |
| `DB_PORT`                     | Railway | MySQL port (usually 3306)               |
| `DB_USER`                     | Railway | MySQL username                          |
| `DB_PASSWORD`                 | Railway | MySQL password                          |
| `DB_NAME`                     | Railway | MySQL database name                     |
| `RESEND_API_KEY`              | Railway | Your Resend API key (starts with `re_`) |
| `EMAIL_RECEIVER`              | Railway | Email address to receive notifications  |
| `VITE_API_URL`                | Vercel  | Full URL of your Railway backend        |

---

## 👨‍💻 Author

**Nikhil Telkar** — Intern  
📧 nikhiltelkar19@gmail.com | [GitHub](https://github.com/nikhiltelkar2005-glitch)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
