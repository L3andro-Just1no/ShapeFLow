import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import 'signin_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Stack(
          children: [
            // Background Image with Overlay
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/clean-workout-hero.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.5),
                        Colors.black.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
                         // Content
             SafeArea(
               child: Column(
                 children: [
                   // Header Section (Top)
                   Expanded(
                     flex: 1,
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                                                       const SizedBox(height: 40),
                            
                            // Logo and Brand
                           Row(
                             children: [
                               Container(
                                 padding: const EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   color: Colors.green.withValues(alpha: 0.2),
                                   borderRadius: BorderRadius.circular(50),
                                   border: Border.all(
                                     color: Colors.green.withValues(alpha: 0.3),
                                   ),
                                 ),
                                 child: const FaIcon(
                                   FontAwesomeIcons.dumbbell,
                                   color: Colors.green,
                                   size: 24,
                                 ),
                               ),
                               const SizedBox(width: 12),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Text(
                                     'FITPRO',
                                     style: TextStyle(
                                       color: Colors.green,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 16,
                                       letterSpacing: 1.0,
                                     ),
                                   ),
                                   Text(
                                     'Next-Gen Fitness',
                                     style: TextStyle(
                                       color: Colors.grey[400],
                                       fontSize: 11,
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           
                                                       const SizedBox(height: 40),
                            
                            // Main Heading
                           Text(
                             'TRANSFORM\nYOUR\n',
                             style: TextStyle(
                               fontSize: MediaQuery.of(context).size.width * 0.08,
                               fontWeight: FontWeight.w900,
                               color: Colors.white,
                               height: 1.1,
                               letterSpacing: -1.0,
                             ),
                           ),
                           ShaderMask(
                             shaderCallback: (bounds) => const LinearGradient(
                               colors: [Colors.green, Colors.teal],
                             ).createShader(bounds),
                             child: Text(
                               'LIMITS',
                               style: TextStyle(
                                 fontSize: MediaQuery.of(context).size.width * 0.08,
                                 fontWeight: FontWeight.w900,
                                 color: Colors.white,
                                 height: 1.1,
                                 letterSpacing: -1.0,
                               ),
                             ),
                           ),
                           
                                                       const SizedBox(height: 30),
                            
                            // Description
                           Text(
                             'Unlock your potential with AI-powered workouts designed to push you beyond what you thought possible',
                             style: TextStyle(
                               color: Colors.grey[300],
                               fontSize: MediaQuery.of(context).size.width * 0.035,
                               height: 1.4,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   
                   // Bottom Section (Bottom)
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                       children: [
                         // Feature Pills
                         Wrap(
                           spacing: 6,
                           runSpacing: 6,
                           children: [
                             _buildFeaturePill(
                               icon: FontAwesomeIcons.bolt,
                               text: 'AI Powered',
                             ),
                             _buildFeaturePill(
                               icon: FontAwesomeIcons.bullseye,
                               text: 'Personalized',
                             ),
                             _buildFeaturePill(
                               icon: FontAwesomeIcons.trophy,
                               text: 'Results Driven',
                             ),
                           ],
                         ),
                         
                                                   const SizedBox(height: 35),
                          
                          // Get Started Button
                         SizedBox(
                           width: double.infinity,
                           height: 50,
                           child: ElevatedButton(
                             onPressed: () {
                               context.read<AppProvider>().setOnboarded(true);
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.transparent,
                               foregroundColor: Colors.white,
                               elevation: 0,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(16),
                               ),
                               padding: EdgeInsets.zero,
                             ).copyWith(
                               backgroundColor: WidgetStateProperty.all(Colors.transparent),
                             ),
                             child: Container(
                               decoration: BoxDecoration(
                                 gradient: const LinearGradient(
                                   colors: [Colors.green, Colors.teal],
                                 ),
                                 borderRadius: BorderRadius.circular(16),
                                 border: Border.all(
                                   color: Colors.green.withValues(alpha: 0.3),
                                 ),
                               ),
                               child: const Center(
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                       'Start Your Journey',
                                       style: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.white,
                                       ),
                                     ),
                                     SizedBox(width: 8),
                                     FaIcon(
                                       FontAwesomeIcons.arrowRight,
                                       color: Colors.white,
                                       size: 20,
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                         
                                                   const SizedBox(height: 30),
                          
                          // Sign In Link
                         Column(
                           children: [
                             Text(
                               'Already crushing your goals?',
                               style: TextStyle(
                                 color: Colors.grey[400],
                                 fontSize: 14,
                               ),
                             ),
                             const SizedBox(height: 8),
                             GestureDetector(
                               onTap: () {
                                 Navigator.of(context).push(
                                   MaterialPageRoute(
                                     builder: (context) => const SignInScreen(),
                                   ),
                                 );
                               },
                               child: Container(
                                 padding: const EdgeInsets.only(bottom: 2),
                                 decoration: const BoxDecoration(
                                   border: Border(
                                     bottom: BorderSide(
                                       color: Colors.green,
                                       width: 1.5,
                                     ),
                                   ),
                                 ),
                                 child: const Text(
                                   'Sign In Here',
                                   style: TextStyle(
                                     color: Colors.green,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 16,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         
                                                   const SizedBox(height: 30),
                          
                          // Stats Section
                         Container(
                           padding: const EdgeInsets.symmetric(horizontal: 12),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               _buildStatItem('1M+', 'Active Users'),
                               Container(
                                 width: 1,
                                 height: 30,
                                 color: Colors.grey[600],
                               ),
                               _buildStatItem('500+', 'Workouts'),
                               Container(
                                 width: 1,
                                 height: 30,
                                 color: Colors.grey[600],
                               ),
                               _buildStatItem('98%', 'Success Rate'),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturePill({
    required IconData icon,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: Colors.green,
            size: 12,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w900,
            fontSize: 18,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
} 