import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:firebase_analytics/firebase_analytics.dart'; // Import Firebase Analytics
import 'package:shop/route/route_constants.dart';
import 'package:shop/route/router.dart' as router;
import 'package:shop/theme/app_theme.dart';

void main() async {
  // Ensure widgets are initialized before Firebase is set up
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize FirebaseAnalytics instance
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Run the app and pass the analytics instance
  runApp(MyApp(analytics: analytics)); // Pass analytics as a named parameter
}

class MyApp extends StatelessWidget {
  // Constructor accepts FirebaseAnalytics instance as a parameter
  const MyApp({super.key, required this.analytics});

  // Declare 'analytics' as a required parameter to initialize in the constructor
  final FirebaseAnalytics analytics;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Log an event to Firebase Analytics (e.g., App Open)
    analytics.logAppOpen();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop baby clothes',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: onbordingScreenRoute,
    );
  }
}
