import 'package:flutter/material.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>moveToNextScreen()async {
    Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenBg(
          child: Center(child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
          ),
        ),
      ) ,
    );
  }
}
