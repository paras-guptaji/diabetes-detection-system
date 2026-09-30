# 🚀 Cloud Deployment Guide

This guide walks you through deploying the complete **Diabetes Type-2 Detection & Prevention System** online for free so you can showcase it to anyone with a public URL.

---

## 🏗️ Architecture Overview

The system consists of 3 services:
1. **Frontend (`client`)**: React + Vite SPA (Hosted on **Vercel** - Free & Fast CDN).
2. **Auth Backend (`server`)**: Node.js + Express (Hosted on **Render** - Free Web Service).
3. **ML Prediction API (`ml_api`)**: Python Flask + TensorFlow LSTM Model (Hosted on **Render** or **Hugging Face Spaces** - Free Web Service).

---

## 1️⃣ Step 1: Push Project to GitHub

1. Open [github.com/new](https://github.com/new) in your browser.
2. Create a new repository named `diabetes-detection-system` (keep it **Public** or **Private**, don't initialize with README).
3. In your local terminal, run:

```bash
git remote add origin https://github.com/paras-guptaji/diabetes-detection-system.git
git branch -M main
git push -u origin main
```

---

## 2️⃣ Step 2: Deploy Backend Services on Render (Free)

1. Go to [render.com](https://render.com) and log in with your GitHub account.
2. Click **New +** → **Blueprint**.
3. Select your repository `diabetes-detection-system`.
4. Render will automatically read `render.yaml` and configure:
   - **`diabetes-ml-api`** (Python 3.11 with Gunicorn & TensorFlow)
   - **`diabetes-auth-backend`** (Node.js Express)
5. Click **Apply**.
6. Once deployed, Render will provide two live URLs, for example:
   - ML API: `https://diabetes-ml-api-xxxx.onrender.com`
   - Express Backend: `https://diabetes-auth-backend-xxxx.onrender.com`

---

## 3️⃣ Step 3: Deploy Frontend on Vercel (Free)

1. Go to [vercel.com](https://vercel.com) and log in with your GitHub account.
2. Click **Add New...** → **Project**.
3. Import your repository `diabetes-detection-system`.
4. Configure Project Settings:
   - **Root Directory**: Click edit and select `client`
   - **Framework Preset**: `Vite` (automatically detected)
5. Add **Environment Variables**:
   | Key | Value (from Step 2) |
   | :--- | :--- |
   | `VITE_API_URL` | `https://diabetes-auth-backend-xxxx.onrender.com/api/auth` |
   | `VITE_PREDICTION_API_URL` | `https://diabetes-ml-api-xxxx.onrender.com` |
   | `VITE_GOOGLE_CLIENT_ID` | `1011861036218-rlmslse55gsvurnlvcvb5jgbm3sfh5r6.apps.googleusercontent.com` |
6. Click **Deploy**.

---

## 4️⃣ Done! 🎉

Your project is now 100% live on the internet:
- Anyone can visit your Vercel URL (e.g. `https://diabetes-pred.vercel.app`).
- They can register an account or log in.
- They can input biomarker data and get real-time LSTM machine learning risk predictions!
