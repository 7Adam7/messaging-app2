#!/bin/bash

# Messaging App 2 Setup Script
# This script automates the initial setup process

echo "🚀 Messaging App 2 - Setup Script"
echo "================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 14.0 or higher."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"
echo ""

# Create uploads directory if it doesn't exist
if [ ! -d "uploads" ]; then
    echo "📁 Creating uploads directory..."
    mkdir -p uploads
    echo "✅ Uploads directory created"
else
    echo "✅ Uploads directory already exists"
fi

echo ""

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies (this may take a minute)..."
    npm install
    if [ $? -eq 0 ]; then
        echo "✅ Dependencies installed successfully"
    else
        echo "❌ Failed to install dependencies"
        exit 1
    fi
else
    echo "✅ Dependencies already installed"
fi

echo ""

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "⚙️  Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created"
    echo "   Edit with: nano .env (optional)"
else
    echo "✅ .env file already exists"
fi

echo ""
echo "================================="
echo "✨ Setup Complete!"
echo "================================="
echo ""
echo "📝 Next steps:"
echo "   1. Start the server: npm start"
echo "   2. Open browser: http://localhost:3001"
echo "   3. Enter username and start chatting!"
echo ""
echo "💡 Useful commands:"
echo "   npm start      - Start the server"
echo "   npm run dev    - Start with auto-reload"
echo "   npm install    - Install dependencies"
echo ""
echo "📖 Documentation:"
echo "   README.md      - Full project documentation"
echo "   QUICKSTART.md  - Quick start guide"
echo "   DEPLOYMENT.md  - Deployment instructions"
echo ""
echo "Happy coding! 🎉"
