import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_icons/flutter_icons.dart'; // Import the flutter_icons package
import 'package:shop/route/route_constants.dart';

import '../../../constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Google Sign-In method
  Future<void> _signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      if (!mounted) return;
      Navigator.pushNamed(context, entryPointScreenRoute);
    } catch (e) {
      print("Google sign-in error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/image copy 2.png",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get started!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Please sign up using your Google account.",
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  // Google Sign Up Button with Google icon from flutter_icons
                  ElevatedButton.icon(
                    onPressed: _signInWithGoogle,
                    icon: const Icon(
                        FlutterIcons.google_ant), // Using Google icon
                    label: const Text("Sign Up with Google"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, logInScreenRoute);
                        },
                        child: const Text("Log in"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
