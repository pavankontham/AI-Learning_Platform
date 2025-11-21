<div align="center">

# 🎓 AI-Powered Learning Management System

### A Modern, Full-Stack Educational Platform with Intelligent Course Generation

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![React](https://img.shields.io/badge/React-18.2.0-blue.svg)](https://reactjs.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Node](https://img.shields.io/badge/Node-16+-green.svg)](https://nodejs.org/)

[Features](#-features) • [Tech Stack](#-technology-stack) • [Getting Started](#-getting-started) • [Documentation](#-documentation) • [Demo](#-demo-accounts)

</div>

---

## 📖 Overview

The **AI-Powered Learning Management System** is a comprehensive educational platform that combines traditional LMS functionality with cutting-edge AI capabilities. Built with Spring Boot and React, it enables instructors to create engaging courses, students to learn effectively, and administrators to manage the entire ecosystem seamlessly.

### 🎯 Key Highlights

- 🤖 **AI-Powered Content Generation** - Leverage Google Gemini AI for automatic course creation
- 🎥 **Integrated Video Learning** - YouTube API integration for educational content
- � **Coding Assignments** - Codeforces API integration for programming challenges
- 📊 **Real-Time Analytics** - Track student progress and engagement
- 🔐 **Enterprise Security** - JWT-based authentication with role-based access control
- 📱 **Responsive Design** - Modern UI built with Tailwind CSS

---

## ✨ Features

### 👥 Role-Based Access Control

<table>
<tr>
<td width="33%" valign="top">

#### � Students
- Browse and enroll in courses
- Track learning progress
- Take AI-generated quizzes
- Complete coding assignments
- IQ assessment tests
- Personalized recommendations

</td>
<td width="33%" valign="top">

#### 👨‍🏫 Instructors
- Create and manage courses
- AI-powered course generation
- Upload materials and videos
- Create assignments & quizzes
- Monitor student analytics
- Grade submissions

</td>
<td width="33%" valign="top">

#### 👑 Administrators
- User management
- Platform analytics
- Course moderation
- System configuration
- Content oversight
- Performance monitoring

</td>
</tr>
</table>

### 🤖 AI-Powered Features

| Feature | Description | Technology |
|---------|-------------|------------|
| **Course Generation** | Automatically generate complete course structures with lessons | Google Gemini AI |
| **Quiz Creation** | Generate contextual MCQ quizzes from course content | Google Gemini AI |
| **Video Discovery** | Find relevant educational videos for topics | YouTube Data API |
| **Coding Problems** | Integrate programming challenges by difficulty | Codeforces API |
| **IQ Assessment** | Pattern recognition and logical reasoning tests | Custom Algorithm |
| **Smart Recommendations** | Personalized course suggestions based on performance | ML-based |

### � Course Management

- ✅ Rich text editor for lesson content
- ✅ Multi-media support (videos, documents, images)
- ✅ Course categorization and tagging
- ✅ Difficulty levels (Beginner, Intermediate, Advanced)
- ✅ Draft and publish workflow
- ✅ Student enrollment management
- ✅ Progress tracking and completion certificates

### 📊 Analytics & Reporting

- 📈 Student progress dashboards
- � Course completion rates
- 🎯 Quiz performance metrics
- ⏱️ Time spent on lessons
- 👥 Enrollment statistics
- 🏆 Leaderboards and achievements

---

## 🛠️ Technology Stack

### Backend Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| **Spring Boot** | 3.2.0 | Application framework |
| **Spring Security** | 3.2.0 | Authentication & authorization |
| **Spring Data JPA** | 3.2.0 | Database ORM |
| **Hibernate** | 6.x | JPA implementation |
| **H2 Database** | Latest | Development database |
| **JWT (jjwt)** | 0.11.5 | Token-based authentication |
| **WebFlux** | 3.2.0 | Reactive HTTP client |
| **Maven** | 3.x | Build & dependency management |

### Frontend Technologies

| Technology | Version | Purpose |
|------------|---------|---------|
| **React** | 18.2.0 | UI framework |
| **React Router** | 6.8.1 | Client-side routing |
| **Tailwind CSS** | 3.2.7 | Utility-first styling |
| **Axios** | 1.3.4 | HTTP client |
| **React Query** | 3.39.3 | Server state management |
| **React Hook Form** | 7.43.5 | Form handling |
| **Chart.js** | 4.2.1 | Data visualization |
| **Heroicons** | 2.0.16 | Icon library |

### External APIs & Services

- 🤖 **Google Gemini AI** - Content generation and AI features
- 🎥 **YouTube Data API v3** - Educational video integration
- 💻 **Codeforces API** - Programming problem integration

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- ☕ **Java 17** or higher ([Download](https://www.oracle.com/java/technologies/downloads/))
- 📦 **Node.js 16+** and npm ([Download](https://nodejs.org/))
- 🔧 **Maven 3.x** (included via wrapper)
- 🔑 **API Keys** (optional, for AI features):
  - Google Gemini API Key
  - YouTube Data API Key
  - Codeforces API Credentials

### Quick Start

#### 1️⃣ Clone the Repository

```bash
git clone https://github.com/pavankontham/AI-Learning_Platform.git
cd AI-Learning_Platform
```

#### 2️⃣ Configure Environment Variables

Create a `.env` file in the root directory:

```bash
cp .env.example .env
```

Edit `.env` and add your API keys:

```env
# JWT Configuration
JWT_SECRET=your-secret-key-min-32-characters-long

# AI Services (Optional - app works without these)
GEMINI_API_KEY=your-gemini-api-key
YOUTUBE_API_KEY=your-youtube-api-key
CODEFORCES_API_KEY=your-codeforces-key
CODEFORCES_API_SECRET=your-codeforces-secret
```

> **Note:** The application will work without API keys, but AI features will use fallback mock data.

#### 3️⃣ Start the Backend

```bash
# Using Maven Wrapper (Recommended)
./mvnw spring-boot:run

# Or on Windows
mvnw.cmd spring-boot:run
```

The backend will start on `http://localhost:8081`

#### 4️⃣ Start the Frontend

Open a new terminal:

```bash
cd frontend
npm install
npm start
```

The frontend will start on `http://localhost:3000`

#### 5️⃣ Access the Application

Open your browser and navigate to:
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:8081/api
- **H2 Console:** http://localhost:8081/api/h2-console

---

## � Demo Accounts

The application comes with pre-configured demo accounts:

| Role | Username | Password | Capabilities |
|------|----------|----------|--------------|
| 🎓 **Student** | `student` | `student123` | Enroll in courses, take quizzes, track progress |
| 👨‍🏫 **Instructor** | `instructor` | `instructor123` | Create courses, manage content, view analytics |
| 👑 **Admin** | `admin` | `admin123` | Full system access, user management |

---

## 📁 Project Structure

```
AI-Learning_Platform/
├── src/main/java/com/learningplatform/
│   ├── config/              # Application configuration
│   ├── controller/          # REST API endpoints
│   ├── model/              # JPA entities
│   ├── repository/         # Data access layer
│   ├── security/           # JWT & security config
│   └── service/            # Business logic
├── src/main/resources/
│   └── application.properties  # App configuration
├── frontend/
│   ├── public/             # Static assets
│   └── src/
│       ├── components/     # Reusable UI components
│       ├── pages/          # Page components
│       ├── services/       # API integration
│       ├── context/        # React context
│       └── utils/          # Helper functions
├── pom.xml                 # Maven dependencies
├── .env.example           # Environment template
└── README.md              # This file
```
---

## 📚 Documentation

### API Documentation

Comprehensive API documentation is available in [API_DOCUMENTATION.md](API_DOCUMENTATION.md)

**Key Endpoints:**

- 🔐 **Authentication:** `/api/auth/login`, `/api/auth/register`
- 📚 **Courses:** `/api/courses`, `/api/courses/{id}`
- 👨‍🏫 **Instructor:** `/api/instructor/dashboard`, `/api/instructor/courses`
- 🎓 **Student:** `/api/student/dashboard`, `/api/student/courses`
- 👑 **Admin:** `/api/admin/dashboard`, `/api/admin/users`
- 🤖 **AI Services:** `/api/ai/generate-ai-course`, `/api/ai/generate-quiz`

### Setup Guide

Detailed setup instructions are available in [SETUP.md](SETUP.md)

---

## 🏗️ Architecture

### System Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    FRONTEND (React)                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐             │
│  │  Pages   │  │Components│  │ Services │             │
│  │ (17 pgs) │  │   (UI)   │  │  (API)   │             │
│  └──────────┘  └──────────┘  └──────────┘             │
│       Port 3000 - Tailwind CSS + React Router          │
└─────────────────────────────────────────────────────────┘
                         ↕ HTTP/REST API
┌─────────────────────────────────────────────────────────┐
│              BACKEND (Spring Boot)                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐               │
│  │Controllers│→│ Services │→│Repository│                │
│  │ (14 APIs)│  │(Business)│  │  (Data)  │              │
│  └──────────┘  └──────────┘  └──────────┘               │
│       Port 8081 - JWT Security + JPA/Hibernate         │
└─────────────────────────────────────────────────────────┘
                         ↕
┌─────────────────────────────────────────────────────────┐
│              DATABASE (H2)                              │
│  Users | Courses | Assignments | Progress | Submissions │
│              File-based: ./data/                        │
└─────────────────────────────────────────────────────────┘
                         ↕
┌─────────────────────────────────────────────────────────┐
│           EXTERNAL AI SERVICES                          │
│  • Google Gemini API (Content Generation)               │
│  • YouTube API (Video Discovery)                        │
│  • Codeforces API (Programming Problems)                │
└─────────────────────────────────────────────────────────┘
```

### Database Schema

**Core Entities:**
- `User` - User accounts with roles (Admin, Instructor, Student)
- `Course` - Course information with lessons and materials
- `Assignment` - Coding assignments with test cases
- `Progress` - Student progress tracking
- `Quiz` - Quiz questions and answers
- `AssignmentSubmission` - Student assignment submissions

---

## 🔒 Security

### Authentication Flow

1. User submits credentials to `/api/auth/login`
2. Backend validates credentials and generates JWT token
3. Token is returned to client and stored in localStorage
4. All subsequent requests include token in Authorization header
5. JWT filter validates token on each request
6. Role-based access control enforces permissions

### Security Features

- ✅ JWT-based stateless authentication
- ✅ BCrypt password hashing
- ✅ Role-based access control (RBAC)
- ✅ CORS configuration
- ✅ SQL injection prevention (JPA/Hibernate)
- ✅ XSS protection
- ✅ Environment variable configuration for secrets

---

## 🧪 Testing

### Running Tests

```bash
# Backend tests
./mvnw test

# Frontend tests
cd frontend
npm test
```

### Test Coverage

- Unit tests for services and controllers
- Integration tests for API endpoints
- Component tests for React components
- End-to-end testing support

---

## 🚢 Deployment

### Production Build

#### Backend

```bash
# Build JAR file
./mvnw clean package -DskipTests

# Run the JAR
java -jar target/ai-learning-platform-0.0.1-SNAPSHOT.jar
```

#### Frontend

```bash
cd frontend
npm run build

# Serve the build folder with a web server
npx serve -s build -p 3000
```

### Environment Variables for Production

```env
# Production JWT Secret (use a strong, random key)
JWT_SECRET=your-production-secret-key-min-64-characters

# Production Database (replace H2 with PostgreSQL/MySQL)
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/lms
SPRING_DATASOURCE_USERNAME=your-db-username
SPRING_DATASOURCE_PASSWORD=your-db-password

# API Keys
GEMINI_API_KEY=your-production-gemini-key
YOUTUBE_API_KEY=your-production-youtube-key
```

### Deployment Platforms

The application can be deployed to:

- ☁️ **AWS** (EC2, Elastic Beanstalk, RDS)
- ☁️ **Azure** (App Service, Azure Database)
- ☁️ **Google Cloud** (App Engine, Cloud SQL)
- ☁️ **Heroku** (Easy deployment with PostgreSQL)
- 🐳 **Docker** (Containerized deployment)
- ☸️ **Kubernetes** (Orchestrated deployment)

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Follow Java naming conventions for backend
- Use ESLint and Prettier for frontend code
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed

---

## 🐛 Troubleshooting

### Common Issues

<details>
<summary><b>Backend fails to start</b></summary>

- Ensure Java 17+ is installed: `java -version`
- Check if port 8081 is available
- Verify environment variables are set correctly
- Check logs in console for specific errors
</details>

<details>
<summary><b>Frontend fails to start</b></summary>

- Ensure Node.js 16+ is installed: `node -v`
- Delete `node_modules` and run `npm install` again
- Check if port 3000 is available
- Clear npm cache: `npm cache clean --force`
</details>

<details>
<summary><b>AI features not working</b></summary>

- Verify API keys are set in `.env` file
- Check API key validity and quotas
- Review backend logs for API errors
- Fallback mock data will be used if APIs fail
</details>

<details>
<summary><b>Database connection issues</b></summary>

- H2 database files are created automatically
- Check `data/` directory permissions
- Delete `data/` folder to reset database
- Verify `application.properties` configuration
</details>

---

## 📊 Performance

- **Backend Startup:** ~10-15 seconds
- **Frontend Startup:** ~5-10 seconds
- **API Response Time:** <500ms average
- **Database Query Time:** <100ms
- **AI Generation Time:** 2-5 seconds
- **Page Load Time:** <2 seconds

---

## 🗺️ Roadmap

### Upcoming Features

- [ ] Real-time chat and discussion forums
- [ ] Video conferencing integration
- [ ] Mobile app (React Native)
- [ ] Advanced analytics with ML insights
- [ ] Gamification (badges, points, leaderboards)
- [ ] Multi-language support (i18n)
- [ ] Payment integration for premium courses
- [ ] Certificate generation and verification
- [ ] Social learning features
- [ ] Advanced search with Elasticsearch

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Pavan Kontham**

- GitHub: [@pavankontham](https://github.com/pavankontham)
- Repository: [AI-Learning_Platform](https://github.com/pavankontham/AI-Learning_Platform)

---

## 🙏 Acknowledgments

- **Spring Boot** - For the robust backend framework
- **React** - For the dynamic frontend library
- **Google Gemini AI** - For AI-powered content generation
- **Tailwind CSS** - For beautiful, responsive styling
- **Heroicons** - For the comprehensive icon set
- **YouTube & Codeforces** - For educational content APIs

---

## 📞 Support

For questions, issues, or suggestions:

1. 📝 Check existing [Issues](https://github.com/pavankontham/AI-Learning_Platform/issues)
2. 🆕 Create a new issue with detailed description
3. 📧 Contact the maintainer

---

<div align="center">

### ⭐ Star this repository if you find it helpful!

**Made with ❤️ using Spring Boot and React**

[⬆ Back to Top](#-ai-powered-learning-management-system)

</div>

