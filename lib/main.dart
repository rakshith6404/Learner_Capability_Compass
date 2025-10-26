// This is the complete Flutter prototype for the Learner's Capability Compass.
// This single file contains all 5 required screens and the navigation logic.
//
// --- VERSION 3 (FIXED) ---
// This version corrects the icon error for the bottom navigation bar.
//

import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

void main() {
  runApp(const LearnerCompassApp());
}

class LearnerCompassApp extends StatelessWidget {
  const LearnerCompassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learner Compass',
      theme: ThemeData(
        // Use a modern, professional color scheme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003366), // A deep, trustworthy blue
          brightness: Brightness.light,
          primary: const Color(0xFF003366),
          secondary: const Color(0xFF4D85BD),
        ),
        fontFamily: 'Inter', // Assumed to be available, or use default
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7FA), // Light grey background
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F7FA),
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: Colors.black,
        ),
        // Style for cards
        // *** FIX 1: Changed CardTheme to CardThemeData ***
        cardTheme: CardThemeData(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey[200]!),
          ),
          color: Colors.white,
        ),
        // Style for buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF003366), // Primary color
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          ),
        ),
        // Style for text fields
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF003366), width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // Define the routes
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/app': (context) => const MainAppShell(),
      },
    );
  }
}

// ------------------------------------------
// SCREEN 1: ONBOARDING
// (Meets requirement 1: "Onboarding (Sign-up/Login)")
// ------------------------------------------
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // App Logo/Icon
                const Icon(
                  LucideIcons.compass,
                  color: Color(0xFF003366),
                  size: 64,
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome to your\nCapability Compass',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Sign in to start tracking your journey.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 40),
                // Email Field
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(LucideIcons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password Field
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(LucideIcons.lock),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                // Sign In Button
                ElevatedButton(
                  onPressed: () {
                    // This action simulates a successful login
                    // and navigates to the main app shell.
                    Navigator.pushReplacementNamed(context, '/app');
                  },
                  child: const Text('Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 24),
                // "Or continue with" divider
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Or continue with',
                          style: TextStyle(color: Colors.grey[600])),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
                const SizedBox(height: 24),
                // Social Logins (as required by prompt)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(LucideIcons.linkedin,
                            color: Color(0xFF0A66C2)),
                        label: const Text('LinkedIn',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/app');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        // *** FIX 2: Replaced LucideIcons.chrome with LucideIcons.globe ***
                        icon: const Icon(LucideIcons.globe,
                            color: Color(0xFFEA4335)),
                        label: const Text('Google',
                            style: TextStyle(color: Colors.black)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/app');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Biometric Auth (as required by prompt)
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Use Biometrics',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      const Icon(LucideIcons.fingerprint,
                          size: 32, color: Color(0xFF003366)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------
// MAIN APP SHELL (with Bottom Navigation)
// (Meets requirement for "Best-Practice Mobile Navigation")
// ------------------------------------------
class MainAppShell extends StatefulWidget {
  const MainAppShell({super.key});

  @override
  State<MainAppShell> createState() => _MainAppShellState();
}

class _MainAppShellState extends State<MainAppShell> {
  int _selectedIndex = 0;

  // The 4 main screens required in the challenge (excluding Onboarding)
  static const List<Widget> _screens = <Widget>[
    DashboardScreen(),
    SkillGapScreen(),
    CareerExplorerScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      // A standard Bottom Tab Bar, as suggested in the prompt
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.compass),
            label: 'Compass',
          ),
          BottomNavigationBarItem(
            // *** FINAL FIX: Replaced LucideIcons.pieChart with LucideIcons.barChart ***
            icon: Icon(LucideIcons.chartBar),
            label: 'Skill Gap',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.search),
            label: 'Explorer',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}

// ------------------------------------------
// SCREEN 2: MAIN DASHBOARD (THE "COMPASS")
// (Meets requirement 2: "Main Dashboard")
// ------------------------------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Compass'),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Welcome back, Ananya!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Your Target: Machine Learning Engineer',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[700],
                ),
          ),
          const SizedBox(height: 24),
          // This card shows the "at-a-glance" view of progress
          _buildCompassChart(context),
          const SizedBox(height: 24),
          // This section shows the "immediate recommendations"
          _buildSectionHeader(context, 'Immediate Recommendations'),
          _buildRecommendationCard(
            context,
            'Build a Neural Network Project',
            'Your GitHub shows Python skills, but no TensorFlow projects. This is a 20% gap for your target role.',
            LucideIcons.lightbulb,
          ),
          _buildRecommendationCard(
            context,
            'Contribute to an Open-Source Project',
            'Collaborating on GitHub is a key skill. Find a project to contribute to.',
            LucideIcons.github,
          ),
          const SizedBox(height: 16),
          // This section shows the "skill strengths"
          _buildSectionHeader(context, 'Skill Strengths'),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: const [
              Chip(
                  label: Text('Python (Advanced)'),
                  backgroundColor: Color(0xFFE0F7FA)),
              Chip(
                  label: Text('Data Structures'),
                  backgroundColor: Color(0xFFE0F7FA)),
              Chip(label: Text('Git'), backgroundColor: Color(0xFFE0F7FA)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildCompassChart(BuildContext context) {
    // This is a static mock of the "Compass" visualization
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              'Progress to Target Role',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: 0.65, // 65% progress
                    strokeWidth: 12,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.primary),
                  ),
                ),
                Text(
                  '65%',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'You are 35% away from role readiness. Focus on "Model Deployment" and "TensorFlow".',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(LucideIcons.arrowRight),
        onTap: () {},
      ),
    );
  }
}

// ------------------------------------------
// SCREEN 3: SKILL GAP ANALYSIS
// (Meets requirement 3: "Skill Gap Analysis")
// ------------------------------------------
class SkillGapScreen extends StatelessWidget {
  const SkillGapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill Gap Analysis'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Target Role: Machine Learning Engineer',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 24),
          // Clearly visualizes the skills she has vs. required
          _buildSkillCategory(
            context,
            'Missing Core Skills (High Priority)',
            [
              _buildSkillGapItem(
                  'TensorFlow',
                  '0 projects found. 5+ required.',
                  0.0,
                  const Color(0xFFFDE7E7)), // Red background for missing
              _buildSkillGapItem(
                  'Model Deployment',
                  'No experience detected.',
                  0.0,
                  const Color(0xFFFDE7E7)),
            ],
          ),
          _buildSkillCategory(
            context,
            'Skills to Improve (Medium Priority)',
            [
              _buildSkillGapItem(
                  'Pandas',
                  '3 projects found. 5+ recommended.',
                  0.6,
                  const Color(0xFFFFF9E6)), // Yellow background for in-progress
              _buildSkillGapItem(
                  'Scikit-learn',
                  '4 projects found. 5+ recommended.',
                  0.8,
                  const Color(0xFFFFF9E6)),
            ],
          ),
          _buildSkillCategory(
            context,
            'Acquired Skills (Met)',
            [
              _buildSkillGapItem('Python', '10+ projects. Expert.', 1.0,
                  const Color(0xFFE6F7F0)), // Green background for complete
              _buildSkillGapItem(
                  'Git', 'Active on GitHub.', 1.0, const Color(0xFFE6F7F0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
      BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        ...items,
        const SizedBox(height: 20),
      ],
    );
  }

  // This item includes suggestions on how to close the gap (e.g., "0 projects found. 5+ required.")
  Widget _buildSkillGapItem(
      String skill, String subtitle, double progress, Color bgColor) {
    return Card(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              skill,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(progress < 0.2
                  ? Colors.red
                  : (progress < 0.8 ? Colors.orange : Colors.green)),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------
// SCREEN 4: CAREER PATH EXPLORER
// (Meets requirement 4: "Career Path Explorer")
// ------------------------------------------
class CareerExplorerScreen extends StatelessWidget {
  const CareerExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Path Explorer'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Based on your skills in Python and Data Structures:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          // Shows her current target
          _buildCareerPathCard(
            context,
            'Machine Learning Engineer',
            'Your current target. High demand.',
            '65% Match',
            const Color(0xFFE6F0FF), // Highlighted color
            true,
          ),
          // Shows other related paths
          _buildCareerPathCard(
            context,
            'Data Scientist',
            'Similar to ML, but more focus on statistics and visualization.',
            '55% Match',
            Colors.white,
            false,
          ),
          _buildCareerPathCard(
            context,
            'Backend Developer (Python)',
            'Leverages your Python skills for building web APIs.',
            '40% Match',
            Colors.white,
            false,
          ),
          _buildCareerPathCard(
            context,
            'DevOps Engineer',
            'Focuses on deployment, scaling, and automation.',
            '20% Match',
            Colors.white,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildCareerPathCard(BuildContext context, String title,
      String subtitle, String match, Color bgColor, bool isTarget) {
    return Card(
      color: bgColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Chip(
          label: Text(match, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: isTarget
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[200],
          labelStyle:
              TextStyle(color: isTarget ? Colors.white : Colors.black),
        ),
        onTap: () {},
      ),
    );
  }
}

// ------------------------------------------
// SCREEN 5: USER PROFILE & SETTINGS
// (Meets requirement 5: "User Profile & Settings")
// ------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Info Header
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF003366),
                  child: Text(
                    'AS',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ananya Sharma',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Final Year, Computer Science',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Settings Section
          _buildSectionHeader(context, 'Account'),
          // *** FIX 4: Passed 'context' to all helper methods ***
          _buildSettingsTile(
            context,
            'Edit Profile',
            LucideIcons.user,
            () {},
          ),
          _buildSettingsTile(
            context,
            'Change Password',
            LucideIcons.lock,
            () {},
          ),
          const SizedBox(height: 24),
          // "Connected Accounts" as required
          _buildSectionHeader(context, 'Integrations'),
          _buildSettingsTile(
            context,
            'Connected Accounts',
            LucideIcons.link,
            () {},
            subtitle: 'GitHub, LinkedIn, Coursera',
          ),
          const SizedBox(height: 24),
          // "Privacy Settings" as required
          _buildSectionHeader(context, 'Security & Privacy'),
          _buildSettingsTile(
            context,
            'Privacy Policy',
            LucideIcons.shield,
            () {},
          ),
          _buildSettingsTile(
            context,
            'Data Collection Settings',
            LucideIcons.database,
            () {},
          ),
          _buildSettingsTile(
            context,
            'Manage Biometrics (Face ID)',
            LucideIcons.fingerprint,
            () {},
          ),
          const SizedBox(height: 32),
          // Logout Button
          TextButton(
            onPressed: () {
              // Navigates back to the onboarding screen
              Navigator.pushReplacementNamed(context, '/onboarding');
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  // *** FIX 4: Added 'BuildContext context' as the first parameter ***
  Widget _buildSettingsTile(BuildContext context, String title, IconData icon,
      VoidCallback onTap,
      {String? subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: const Icon(LucideIcons.chevronRight, size: 18),
        onTap: onTap,
      ),
    );
  }
}

