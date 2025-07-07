import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      // Original push, nach ChatGPT besser pushReplacement
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
