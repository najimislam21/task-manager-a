import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen() ,
    );
  }
}
