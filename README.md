# 📱 Learner's Capability Growth Compass
**Developer:** S. Rakshith  
**Submission:** Osmosis Learn Software Internship Challenge – Round 2  

---

## 🌟 Overview
The **Learner’s Capability Growth Compass** is a Flutter-based mobile application designed to help learners take charge of their career growth.

Unlike traditional LMS dashboards that only track course completions, this app focuses on **capability development**, helping users answer:
> “What skills do I have today, what career do I want, and what’s the best capability path to reach it?”

---

## 👩‍💻 Core Idea
Built around the learner persona *Ananya Sharma*, the app guides her weekly learning journey by:
- Showing skill strengths and gaps through a dynamic dashboard (“The Compass”)
- Recommending focused learning goals each week
- Integrating her data from platforms like GitHub, LinkedIn, and Coursera
- Visualizing career paths and next-step recommendations

---

## 🖼️ Key Screens
1. **Onboarding:** Simple and secure login using email, social accounts, or biometrics
   - **Just click on the Login button to sign in, no need to register using your Google Account or your other accounts linked.**
3. **Dashboard (Compass):** Central view of progress, goals, and recommendations  
4. **Skill Gap Analysis:** Visualizes skills owned vs. skills needed for target roles  
5. **Career Path Explorer:** Interactive mapping of related roles and capabilities  
6. **Profile & Settings:** Account management and data integrations  

Screenshots used in the Round 2 PDF are taken directly from this Flutter prototype.

---

## 🧰 Tech Stack
| Layer | Technology | Why |
|-------|-------------|-----|
| Frontend | Flutter | Single codebase for iOS & Android, smooth UI |
| Backend | Node.js (Express) | Handles API and integrations efficiently |
| Database | PostgreSQL | Manages user–skill–career relationships |

---

## 🔐 Security Considerations
1. **TLS/SSL + Certificate Pinning** for secure data transmission  
2. **JWT Authentication** to ensure users access only their own data  

---

## 🚀 Getting Started
```bash
git clone https://github.com/rakshith6404/Learner_Capability_Compass
cd Learner_Capability_Compass
flutter pub get
flutter run
