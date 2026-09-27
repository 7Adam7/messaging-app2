# ⚡ Quick Start Guide

Get your messaging app up and running in 5 minutes!

## 1️⃣ Clone & Setup (2 minutes)

```bash
# Clone the repository
git clone https://github.com/7Adam7/messaging-app2.git
cd messaging-app2

# Install dependencies
npm install
```

## 2️⃣ Configure (1 minute)

```bash
# Copy environment template
cp .env.example .env

# Edit if needed (optional for local development)
# nano .env
```

## 3️⃣ Run Locally (1 minute)

```bash
# Start the server
npm start

# Or with auto-reload during development
npm run dev
```

## 4️⃣ Open in Browser (1 minute)

```
http://localhost:3001
```

Enter a username and start chatting! Open multiple browser tabs to test.

---

## Common Issues & Solutions

### ❌ "Cannot find module 'express'"
```bash
# Solution: Install dependencies
npm install
```

### ❌ "Port 3001 already in use"
```bash
# Solution 1: Kill the process using port 3001
lsof -i :3001
kill -9 <PID>

# Solution 2: Use a different port
echo "PORT=3002" >> .env
```

### ❌ "Cannot connect to server"
```bash
# Make sure:
# 1. Server is running (npm start)
# 2. You're accessing http://localhost:3001 (not https)
# 3. Check browser console for errors (F12)
```

### ❌ "File upload not working"
```bash
# The uploads folder will be created automatically
# If it fails:
mkdir uploads
chmod 755 uploads
```

---

## Features to Try

✅ **Real-time messaging**
- Type a message and hit Enter

✅ **Media sharing**
- Click the 📎 button to upload images or videos
- Supported formats: JPG, PNG, GIF, WebP, MP4, WebM, MOV

✅ **User list**
- See active users at the top
- Get notifications when users join/leave

✅ **Multi-user chat**
- Open multiple browser windows/tabs
- Messages sync across all connected users

---

## Project Structure

```
messaging-app2/
├── server.js          # Main server (Express + Socket.IO)
├── package.json       # Dependencies & scripts
├── index.html         # Frontend (single file)
├── .env.example       # Environment config template
├── uploads/           # User-uploaded media
├── README.md          # Full documentation
├── DEPLOYMENT.md      # Deploy to production
└── QUICKSTART.md      # This file!
```

---

## Next: Deploy to Production

Ready to share with the world? See [DEPLOYMENT.md](DEPLOYMENT.md) for:
- 🟪 **Heroku** (easiest)
- 🚃 **Railway** (recommended)
- 🎨 **Render**
- 🌊 **DigitalOcean**
- ☁️ **AWS**

---

## Development Tips

### Auto-reload on file changes
```bash
npm run dev
```

### View server logs
```bash
# Logs appear in terminal running 'npm start'
# Common: "New user connected: socket-id"
# Common: "User disconnected: socket-id"
```

### Debug client-side (in browser)
1. Open DevTools: F12 or Right-click → Inspect
2. Console tab: See socket.io events
3. Network tab: Monitor WebSocket connections

### Test with multiple users
```bash
# Terminal 1: Start server
npm start

# Then open multiple browser windows:
# - http://localhost:3001 (User 1)
# - http://localhost:3001 (User 2)
# - http://localhost:3001 (User 3)
```

---

## Customization Ideas

🎨 **Styling**
- Edit CSS in `index.html` (look for `<style>` tag)
- Change colors: `#667eea` and `#764ba2`

📱 **Mobile friendly** (already responsive!)
- Works on phones and tablets
- Try on your phone: http://your-ip:3001

⚡ **Add features**
- Typing indicators
- Message reactions
- User profiles
- Private messages
- And more!

---

## Need Help?

- 📖 See [README.md](README.md) for full documentation
- 🚀 See [DEPLOYMENT.md](DEPLOYMENT.md) for deployment help
- 🐛 Check browser console (F12) for error messages
- 💬 Open an issue on GitHub

---

## You're All Set! 🎉

Start chatting and have fun building!
