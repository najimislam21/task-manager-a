import 'package:flutter/material.dart';
import 'package:task_manager_a/controller/auth_controller.dart';
import 'package:task_manager_a/screens/authentication_screen/log_in_screen.dart';
import 'package:task_manager_a/screens/main_nav_screen.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      moveToNextScreen();
    });
  }

  Future<void>moveToNextScreen()async {
    Future.delayed(Duration(seconds: 2));
    await AuthController.getUserData();
    bool isLogin = await AuthController.usUserLogin();

    if( isLogin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
    }
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
