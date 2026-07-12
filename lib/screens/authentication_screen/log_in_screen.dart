import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/authentication_screen/sign_up_screen.dart';
import 'package:task_manager_a/screens/main_nav_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  void onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUpScreen()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    'Get Started With',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12,),

                  FilledButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
                  }, child:Icon(Icons.arrow_circle_right,size: 24)),

                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            text: "Don't Have an Account",
                            style: TextStyle(fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),

                            children: [
                              TextSpan(
                                text: 'Sing Up',
                                style: TextStyle( fontWeight: FontWeight.w500,
                                  color: AppColors.PColor,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = onTapSignUp,
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
          ),
        ),
      ),
    );
  }
}
