import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'screens/onboarding_screen.dart';
import 'providers/app_provider.dart';

void main() {
  runApp(const ShapeFlowApp());
}

class ShapeFlowApp extends StatelessWidget {
  const ShapeFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp.router(
        title: 'ShapeFlow',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            displayMedium: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const OnboardingScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
