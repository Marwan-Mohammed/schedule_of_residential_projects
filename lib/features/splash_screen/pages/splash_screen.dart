import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants_methods.dart';

import '../../on_boarding/pages/on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      goToPage();
    });
  }

  Future<void> goToPage() async {
    Navigator.pushReplacement(context, createRoute(const OnBoardingPage())

        // MaterialPageRoute(
        //     builder: (context) => isHome ? const HomeScreen() : const LoginScreen())
        );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.white.withOpacity(0.0),
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: const Color(0xFFEBE4DA),
          body: SafeArea(child: Image.asset('assets/images/tazmin_logo2.png')),
        ));
  }
}
