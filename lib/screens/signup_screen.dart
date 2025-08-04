import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 1;
  final int totalSteps = 7;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  List<Map<String, String>> steps = [
    {'title': 'Personal Info', 'description': 'Tell us about yourself'},
    {'title': 'Fitness Goals', 'description': 'What do you want to achieve?'},
    {'title': 'Experience', 'description': 'Your fitness background'},
    {'title': 'Preferences', 'description': 'Workout preferences'},
    {'title': 'Schedule', 'description': 'When do you workout?'},
    {'title': 'Health Info', 'description': 'Any health considerations'},
    {'title': 'Account Setup', 'description': 'Create your account'},
  ];

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  double get progressPercentage => (currentStep / totalSteps) * 100;

  bool get isStepValid =>
      fullNameController.text.trim().isNotEmpty && emailController.text.trim().isNotEmpty;

  void handleNext() {
    if (currentStep < totalSteps) {
      setState(() {
        currentStep++;
      });
    }
  }

  void handleBack() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradients/patterns
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0f172a), // slate-900
                  Color(0xFF134e4a), // teal-900
                  Color(0xFF10b981), // emerald-900
                ],
              ),
            ),
          ),
          // Radial overlay
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  const Color(0x1A10b981), // emerald-400, 10% opacity
                  Colors.transparent,
                ],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
          // Linear overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.transparent,
                  const Color(0x0D10b981), // emerald-400, 5% opacity
                  Colors.transparent,
                ],
                stops: const [0.25, 0.5, 0.75],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                          onPressed: () => Navigator.of(context).pop(),
                          padding: const EdgeInsets.all(8),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
                            overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
                            shape: MaterialStateProperty.all(const CircleBorder()),
                          ),
                        ),
                        Row(
                          children: const [
                            FaIcon(FontAwesomeIcons.dumbbell, color: Color(0xFF10b981), size: 28),
                            SizedBox(width: 8),
                            Text(
                              'FITPRO',
                              style: TextStyle(
                                color: Color(0xFF10b981),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Progress Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Step $currentStep of $totalSteps',
                              style: const TextStyle(
                                color: Color(0xFF10b981),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '${progressPercentage.round()}% Complete',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Progress Bar
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: progressPercentage / 100,
                                minHeight: 8,
                                backgroundColor: Colors.white10,
                                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10b981)),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Getting Started', style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text('Ready to Go!', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        // Current Step Info
                        Text(
                          steps[currentStep - 1]['title']!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          steps[currentStep - 1]['description']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    // Form Content
                    if (currentStep == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Full Name
                          const Text(
                            'Full Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children: [
                              TextField(
                                controller: fullNameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white10,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(left: 14, right: 4),
                                    child: FaIcon(FontAwesomeIcons.user, color: Colors.grey, size: 20),
                                  ),
                                  prefixIconConstraints: BoxConstraints(minWidth: 44),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.white24),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.white24),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Color(0xFF10b981)),
                                  ),
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                              if (fullNameController.text.isNotEmpty)
                                const Positioned(
                                  right: 16,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.checkCircle, color: Color(0xFF10b981), size: 20),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          // Email
                          const Text(
                            'Email Address',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Stack(
                            children: [
                              TextField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Enter your email address',
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white10,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.only(left: 14, right: 4),
                                    child: FaIcon(FontAwesomeIcons.solidEnvelope, color: Colors.grey, size: 20),
                                  ),
                                  prefixIconConstraints: BoxConstraints(minWidth: 44),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.white24),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Colors.white24),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Color(0xFF10b981)),
                                  ),
                                ),
                                onChanged: (_) => setState(() {}),
                              ),
                              if (emailController.text.isNotEmpty)
                                const Positioned(
                                  right: 16,
                                  top: 0,
                                  bottom: 0,
                                  child: Center(
                                    child: FaIcon(FontAwesomeIcons.checkCircle, color: Color(0xFF10b981), size: 20),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          // Info Card
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white10),
                            ),
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0x3310b981),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const FaIcon(FontAwesomeIcons.checkCircle, color: Color(0xFF10b981), size: 18),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Secure & Private',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Your personal information is encrypted and never shared with third parties.',
                                        style: TextStyle(color: Colors.grey, fontSize: 12, height: 1.4),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (currentStep > 1)
                      Container(
                        height: 180,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0x3310b981),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: FaIcon(FontAwesomeIcons.dumbbell, color: Color(0xFF10b981), size: 32),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Step $currentStep',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              steps[currentStep - 1]['description']!,
                              style: const TextStyle(color: Colors.grey, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'This step will be implemented next...',
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 32),
                    // Navigation Buttons
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: (currentStep == 1 && !isStepValid)
                                ? null
                                : handleNext,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 6,
                              backgroundColor: Colors.transparent,
                              shadowColor: const Color(0x4010b981),
                              disabledBackgroundColor: Colors.white24,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: (currentStep == 1 && !isStepValid)
                                    ? null
                                    : const LinearGradient(
                                        colors: [Color(0xFF10b981), Color(0xFF14b8a6)],
                                      ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      currentStep == totalSteps
                                          ? 'Complete Registration'
                                          : 'Continue',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.arrow_right_alt, color: Colors.white, size: 24),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (currentStep > 1) ...[
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: OutlinedButton.icon(
                              onPressed: handleBack,
                              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                              label: const Text(
                                'Back',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white10,
                                side: const BorderSide(color: Colors.white24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 18),
                        // Sign In Link
                        Column(
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                'Sign In Here',
                                style: TextStyle(
                                  color: Color(0xFF10b981),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF10b981),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}