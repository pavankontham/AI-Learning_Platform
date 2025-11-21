# 🚀 Setup Guide - AI Learning Platform

This guide will help you set up the AI Learning Platform on your local machine.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Java 17 or higher** - [Download](https://www.oracle.com/java/technologies/downloads/)
- **Node.js 16 or higher** - [Download](https://nodejs.org/)
- **npm** (comes with Node.js) or **yarn**
- **Git** - [Download](https://git-scm.com/)

## 🔑 API Keys Required

You'll need to obtain the following API keys:

### 1. Google Gemini API Key
- Visit [Google AI Studio](https://makersuite.google.com/app/apikey)
- Sign in with your Google account
- Click "Create API Key"
- Copy the generated key

### 2. YouTube Data API Key
- Go to [Google Cloud Console](https://console.cloud.google.com/)
- Create a new project or select an existing one
- Enable "YouTube Data API v3"
- Go to "Credentials" → "Create Credentials" → "API Key"
- Copy the generated key

### 3. Codeforces API Credentials
- Visit [Codeforces API Settings](https://codeforces.com/settings/api)
- Log in to your Codeforces account
- Generate API key and secret
- Copy both values

## 📥 Installation Steps

### Step 1: Clone the Repository

```bash
git clone https://github.com/pavankontham/AI-Learning_Platform.git
cd AI-Learning_Platform
```

### Step 2: Configure Backend

1. **Copy the example configuration file:**
   ```bash
   cp src/main/resources/application.properties.example src/main/resources/application.properties
   ```

2. **Edit the configuration file:**
   Open `src/main/resources/application.properties` in your favorite text editor and update the following:

   ```properties
   # JWT Configuration - Use a strong random secret (at least 32 characters)
   jwt.secret=YOUR_STRONG_SECRET_KEY_HERE_AT_LEAST_32_CHARS
   
   # Gemini API Configuration
   gemini.api.key=YOUR_GEMINI_API_KEY_HERE
   
   # Codeforces API Configuration
   codeforces.api.key=YOUR_CODEFORCES_API_KEY_HERE
   codeforces.api.secret=YOUR_CODEFORCES_API_SECRET_HERE
   
   # YouTube API Configuration
   youtube.api.key=YOUR_YOUTUBE_API_KEY_HERE
   ```

3. **Generate a strong JWT secret (optional but recommended):**
   ```bash
   # On Linux/Mac
   openssl rand -base64 32
   
   # On Windows (PowerShell)
   [Convert]::ToBase64String((1..32 | ForEach-Object { Get-Random -Maximum 256 }))
   ```

### Step 3: Install Backend Dependencies

The Maven wrapper will automatically download dependencies when you run the application.

### Step 4: Install Frontend Dependencies

```bash
cd frontend
npm install
```

## 🏃 Running the Application

### Option 1: Using Start Scripts (Recommended)

**On Linux/Mac:**
```bash
chmod +x start.sh
./start.sh
```

**On Windows:**
```bash
start.bat
```

This will start both the backend and frontend servers.

### Option 2: Manual Start

**Terminal 1 - Backend:**
```bash
# On Linux/Mac
./mvnw spring-boot:run

# On Windows
mvnw.cmd spring-boot:run
```

**Terminal 2 - Frontend:**
```bash
cd frontend
npm start
```

## 🌐 Accessing the Application

Once both servers are running:

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8081/api
- **H2 Database Console**: http://localhost:8081/api/h2-console

## 👥 Demo Accounts

The application comes with pre-configured demo users:

### Instructors
- Username: `instructor` | Password: `instructor123`
- Username: `sarah_wilson` | Password: `instructor123`
- Username: `mike_chen` | Password: `instructor123`

### Students
- Username: `student` | Password: `student123`
- Username: `alex_johnson` | Password: `student123`
- Username: `emma_davis` | Password: `student123`

### Admin
- Username: `admin` | Password: `admin123`

## 🔍 Verifying the Setup

### 1. Check Backend Health
```bash
curl http://localhost:8081/api/auth/validate
```

### 2. Check Frontend
Open http://localhost:3000 in your browser. You should see the login page.

### 3. Test Login
- Use any of the demo accounts above
- You should be redirected to the appropriate dashboard

## 🐛 Troubleshooting

### Backend won't start
- **Issue**: Port 8081 already in use
  - **Solution**: Stop any process using port 8081 or change the port in `application.properties`
  
- **Issue**: Database errors
  - **Solution**: Delete the `data` folder and restart the application

### Frontend won't start
- **Issue**: Port 3000 already in use
  - **Solution**: The system will prompt you to use a different port (usually 3001)
  
- **Issue**: Dependencies not installing
  - **Solution**: Delete `node_modules` and `package-lock.json`, then run `npm install` again

### API Keys not working
- **Issue**: Gemini API errors
  - **Solution**: Verify your API key is correct and has no extra spaces
  - Check if you've enabled the Gemini API in Google Cloud Console
  
- **Issue**: YouTube API errors
  - **Solution**: Ensure YouTube Data API v3 is enabled in your Google Cloud project
  - Check if your API key has the correct restrictions

### CORS Errors
- **Issue**: Frontend can't connect to backend
  - **Solution**: Ensure `cors.allowed.origins=http://localhost:3000` is set in `application.properties`

## 📁 Project Structure

```
AI-Learning_Platform/
├── src/main/java/com/learningplatform/  # Backend source code
│   ├── config/                           # Configuration classes
│   ├── controller/                       # REST API controllers
│   ├── model/                            # Data models
│   ├── repository/                       # Data access layer
│   ├── security/                         # Security configuration
│   └── service/                          # Business logic
├── src/main/resources/
│   ├── application.properties.example    # Example configuration
│   └── application.properties            # Your configuration (not in git)
├── frontend/
│   ├── src/
│   │   ├── components/                   # React components
│   │   ├── pages/                        # Page components
│   │   ├── services/                     # API services
│   │   └── context/                      # React context
│   └── public/                           # Static assets
├── data/                                 # H2 database files (not in git)
└── uploads/                              # Uploaded files (not in git)
```

## 🔒 Security Notes

- **Never commit** `application.properties` with real API keys to version control
- The `.gitignore` file is configured to exclude sensitive files
- Always use environment variables or secure vaults in production
- Change default passwords for demo accounts in production

## 🚀 Next Steps

1. **Explore the Application**: Log in with different user roles to see various features
2. **Create a Course**: Use the instructor account to create your first course
3. **Try AI Features**: Generate AI-powered course content and assignments
4. **Customize**: Modify the code to fit your specific needs

## 📚 Additional Resources

- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [React Documentation](https://react.dev/)
- [Tailwind CSS Documentation](https://tailwindcss.com/)
- [Google Gemini API Documentation](https://ai.google.dev/docs)

## 🆘 Getting Help

If you encounter any issues:

1. Check this setup guide thoroughly
2. Review the troubleshooting section
3. Check existing GitHub issues
4. Create a new issue with detailed information about your problem

## ✅ Setup Checklist

- [ ] Java 17+ installed
- [ ] Node.js 16+ installed
- [ ] Repository cloned
- [ ] API keys obtained (Gemini, YouTube, Codeforces)
- [ ] `application.properties` configured
- [ ] Backend dependencies installed
- [ ] Frontend dependencies installed
- [ ] Backend running on port 8081
- [ ] Frontend running on port 3000
- [ ] Successfully logged in with demo account

Happy Learning! 🎓

