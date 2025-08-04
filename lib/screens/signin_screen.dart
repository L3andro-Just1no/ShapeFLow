import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;
  bool rememberMe = false;

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
                    // Welcome Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WELCOME',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFF10b981), Color(0xFF2dd4bf)],
                          ).createShader(bounds),
                          child: const Text(
                            'BACK',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Ready to crush your fitness goals?',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    // Sign In Form
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Email
                        const Text(
                          'Email',
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
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Password
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              obscureText: !showPassword,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white10,
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 14, right: 4),
                                  child: FaIcon(FontAwesomeIcons.lock, color: Colors.grey, size: 20),
                                ),
                                prefixIconConstraints: BoxConstraints(minWidth: 44),
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.white24),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.white24),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Color(0xFF10b981)),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: FaIcon(
                                showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                                color: Colors.grey,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        // Remember Me & Forgot Password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (val) {
                                    setState(() {
                                      rememberMe = val ?? false;
                                    });
                                  },
                                  activeColor: const Color(0xFF10b981),
                                  checkColor: Colors.white,
                                  side: const BorderSide(color: Colors.white30),
                                ),
                                const Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(color: Color(0xFF10b981), fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF10b981),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 6,
                              backgroundColor: Colors.transparent,
                              shadowColor: const Color(0x4010b981),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF10b981), Color(0xFF14b8a6)],
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Divider
                        Row(
                          children: const [
                            Expanded(
                              child: Divider(
                                color: Colors.white24,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.white24,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        // Social Sign In
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white, size: 22),
                                label: const Text(
                                  'Continue with Google',
                                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  side: const BorderSide(color: Colors.white24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.white, size: 22),
                                label: const Text(
                                  'Continue with Apple',
                                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white10,
                                  side: const BorderSide(color: Colors.white24),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        // Sign Up Link
                        Column(
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO: Navigate to sign up
                              },
                              child: const Text(
                                'Get Started Now!',
                                style: TextStyle(
                                  color: Color(0xFF10b981),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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