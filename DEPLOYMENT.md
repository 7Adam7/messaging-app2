# 🚀 Deployment Guide

This guide covers deploying your Messaging App to various platforms.

## Table of Contents

1. [Heroku](#heroku)
2. [Railway](#railway)
3. [Render](#render)
4. [DigitalOcean](#digitalocean)
5. [AWS](#aws)
6. [Environment Setup](#environment-setup)

## Heroku

### Prerequisites
- Heroku account (https://heroku.com)
- Heroku CLI installed

### Steps

1. **Login to Heroku**
   ```bash
   heroku login
   ```

2. **Create a new app**
   ```bash
   heroku create your-app-name
   ```

3. **Set environment variables**
   ```bash
   heroku config:set NODE_ENV=production
   heroku config:set CLIENT_URL=https://your-app-name.herokuapp.com
   ```

4. **Deploy**
   ```bash
   git push heroku main
   ```

5. **View logs**
   ```bash
   heroku logs --tail
   ```

### Notes
- Heroku has ephemeral storage, so uploaded files won't persist
- Consider using AWS S3 for file storage
- Add `Procfile` if needed: `web: node server.js`

## Railway

### Prerequisites
- Railway account (https://railway.app)
- GitHub account

### Steps

1. **Connect GitHub**
   - Go to railway.app
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Authorize and select `messaging-app2`

2. **Configure environment**
   - In Railway dashboard, go to Variables
   - Add:
     ```
     NODE_ENV=production
     PORT=3001
     CLIENT_URL=https://your-railway-url.railway.app
     ```

3. **Deploy**
   - Railway auto-deploys on git push
   - View deployment status in dashboard

### Notes
- Railway provides 5GB of storage
- File uploads will persist
- Good choice for this app

## Render

### Prerequisites
- Render account (https://render.com)
- GitHub account

### Steps

1. **Create new service**
   - Go to render.com dashboard
   - Click "New +" → "Web Service"
   - Connect GitHub repo

2. **Configure**
   - Name: `messaging-app2`
   - Environment: `Node`
   - Build: `npm install`
   - Start: `npm start`

3. **Set environment variables**
   - Add:
     ```
     NODE_ENV=production
     CLIENT_URL=https://your-service.onrender.com
     ```

4. **Deploy**
   - Click "Create Web Service"
   - Render auto-deploys on git push

### Notes
- Free tier has limitations
- Paid tier includes persistent storage
- Easy GitHub integration

## DigitalOcean

### Prerequisites
- DigitalOcean account (https://digitalocean.com)
- Droplet running Ubuntu 20.04 or later

### Steps

1. **SSH into your droplet**
   ```bash
   ssh root@your_droplet_ip
   ```

2. **Install Node.js and npm**
   ```bash
   curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
   sudo apt-get install -y nodejs
   ```

3. **Clone repository**
   ```bash
   cd /var/www
   git clone https://github.com/7Adam7/messaging-app2.git
   cd messaging-app2
   ```

4. **Install dependencies**
   ```bash
   npm install --production
   ```

5. **Create .env file**
   ```bash
   cp .env.example .env
   nano .env  # Edit as needed
   ```

6. **Setup PM2 (process manager)**
   ```bash
   sudo npm install -g pm2
   pm2 start server.js --name "messaging-app"
   pm2 startup
   pm2 save
   ```

7. **Setup Nginx (reverse proxy)**
   ```bash
   sudo apt-get install nginx
   sudo nano /etc/nginx/sites-available/default
   ```
   
   Add:
   ```nginx
   location / {
     proxy_pass http://localhost:3001;
     proxy_http_version 1.1;
     proxy_set_header Upgrade $http_upgrade;
     proxy_set_header Connection 'upgrade';
     proxy_set_header Host $host;
     proxy_cache_bypass $http_upgrade;
   }
   ```

8. **Enable and restart Nginx**
   ```bash
   sudo systemctl restart nginx
   ```

### Notes
- More control than PaaS platforms
- Persistent file storage
- Better for scaling

## AWS

### Option 1: Elastic Beanstalk (Recommended)

1. **Install EB CLI**
   ```bash
   pip install awsebcli
   ```

2. **Initialize**
   ```bash
   eb init -p node.js-16 messaging-app
   ```

3. **Create environment**
   ```bash
   eb create messaging-app-env
   ```

4. **Set environment variables**
   ```bash
   eb setenv NODE_ENV=production CLIENT_URL=your-app-url
   ```

5. **Deploy**
   ```bash
   eb deploy
   ```

### Option 2: EC2 + S3

- Launch EC2 instance (Ubuntu)
- Follow DigitalOcean steps above
- Use S3 for file storage (modify `server.js`)

## Environment Setup

### Production Variables

Always set these for production:

```env
NODE_ENV=production
PORT=3001
CLIENT_URL=https://your-domain.com
```

### Optional: Database Setup

Add MongoDB:

```bash
npm install mongoose
```

### Optional: S3 File Storage

```bash
npm install aws-sdk
```

Update `server.js` to use S3 instead of local storage.

## SSL/HTTPS

### Using Let's Encrypt

```bash
sudo apt-get install certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
```

### Using Cloudflare

1. Add domain to Cloudflare
2. Update nameservers at registrar
3. Enable "Full" SSL in Cloudflare

## Monitoring & Logging

### PM2 Monitoring
```bash
pm2 monit
pm2 logs
```

### Error Tracking (Optional)
```bash
npm install sentry-sdk
```

## Troubleshooting

### Port already in use
```bash
lsof -i :3001
kill -9 <PID>
```

### CORS errors
- Update `CLIENT_URL` in `.env`
- Ensure it matches your deployed frontend URL

### Socket.IO connection issues
- Check CORS configuration
- Verify WebSocket support is enabled
- Check reverse proxy headers

## Performance Tips

1. **Enable compression**
   ```bash
   npm install compression
   ```

2. **Use Redis for scaling**
   ```bash
   npm install socket.io-redis
   ```

3. **Enable clustering**
   - Use PM2 cluster mode
   - Update for production loads

4. **CDN for static files**
   - Use Cloudflare or AWS CloudFront

## Scaling Considerations

- Current setup works for ~100 concurrent users
- For more: add Redis adapter, database, and load balancing
- Consider microservices architecture for enterprise use

## Next Steps

1. ✅ Deploy to your chosen platform
2. ✅ Setup custom domain
3. ✅ Enable HTTPS
4. ✅ Monitor performance
5. ✅ Scale as needed

Need help? Check platform-specific documentation or open an issue on GitHub.
