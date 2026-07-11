import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/authentication_screen/pin_varification_screen.dart';
import 'package:task_manager_a/screens/authentication_screen/sign_up_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

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
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16,),
                  Text(
                    textAlign: TextAlign.start,
                    'Enter your email address to receive a verification code.',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12,),

                  FilledButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationScreen()));
                  }, child:Icon(Icons.arrow_circle_right,size: 24)),

                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
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
