# PBIP APP - Deployment Guide

## 🚀 Deployment Successful

This document provides instructions for deploying and running the PBIP APP web application.

## Overview

PBIP APP is a complete document management system for handling worker registration, vehicle management, and document handling. The application has been successfully deployed as a web service.

## Features

- **User Authentication**: Login system with admin credentials
- **Worker Management**: Registration and listing of workers
- **Company Management**: Company registration and management
- **Vehicle Management**: Vehicle registration with policy documents
- **Document Handling**: PDF upload, download, and management
- **Reporting**: Various reports with PDF and Excel export capabilities
- **Real-time Search**: Filter and search functionality across all modules

## Prerequisites

- Node.js (version 14.0.0 or higher)
- npm (Node Package Manager)

## Installation

1. **Install dependencies**:
   ```bash
   npm install
   ```

## Running the Application

### Development Mode
```bash
npm run dev
```

### Production Mode
```bash
npm start
```

The application will be available at:
- **Main Application**: http://localhost:3000/
- **Original Version**: http://localhost:3000/original
- **Copy Version**: http://localhost:3000/copia

## Environment Configuration

The application uses environment variables defined in `.env` file:

```env
DB_HOST=localhost
DB_USER=pbip_user
DB_PASS=CHANGE_ME_PASSWORD
DB_NAME=pbipapp
PORT=3000
NODE_ENV=production
```

## Default Login Credentials

- **Username**: admin
- **Password**: admin

## Application Structure

```
PBIPAPP/
├── server.js              # Express server configuration
├── package.json           # Node.js dependencies and scripts
├── .env                   # Environment variables
├── .env.example          # Environment template
├── PBIPAPP.HTML          # Main application (single-page app)
├── PBIPAPP -Original.HTML # Original version
├── PBIPAPP - copia.HTML  # Copy version
└── database files/       # SQL scripts for database setup
```

## Technology Stack

- **Frontend**: HTML5, CSS3 (Tailwind CSS), Vanilla JavaScript
- **Backend**: Node.js, Express.js
- **PDF Handling**: jsPDF, pdf-lib
- **Styling**: Tailwind CSS (CDN)

## External Dependencies (CDN)

The application uses the following external resources:
- Tailwind CSS for styling
- jsPDF for PDF generation
- pdf-lib for PDF manipulation

## Deployment Options

### Local Development
Run `npm start` and access via http://localhost:3000

### Production Deployment
1. Set `NODE_ENV=production` in environment
2. Configure proper database credentials
3. Deploy to your preferred hosting platform (Heroku, AWS, DigitalOcean, etc.)
4. Ensure Port 3000 is accessible or configure PORT environment variable

### Docker Deployment (Optional)
You can containerize the application using Docker by creating a Dockerfile:

```dockerfile
FROM node:14-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
```

## Security Considerations

1. **Change default credentials** before production deployment
2. **Secure environment variables** - never commit `.env` to version control
3. **Configure HTTPS** for production environments
4. **Implement proper authentication** for production use
5. **Set up database security** according to your infrastructure

## Troubleshooting

### Common Issues

1. **Port already in use**: Change PORT in .env file
2. **Dependencies not installed**: Run `npm install`
3. **Permission errors**: Check file permissions
4. **External CDN blocked**: Check internet connectivity and firewall settings

### Debug Mode
Add `DEBUG=*` to environment variables for detailed logging.

## Support

For issues and support, please refer to the repository documentation or contact the development team.

---

✅ **Status**: Successfully deployed and tested
📱 **Tested Features**: Login, Navigation, Forms, Document Management
🔒 **Security**: Basic authentication implemented
🌐 **Access**: Web-based interface ready for production use