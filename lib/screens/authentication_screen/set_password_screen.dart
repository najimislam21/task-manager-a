import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/authentication_screen/email_verification_screen.dart';
import 'package:task_manager_a/screens/authentication_screen/sign_up_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

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
                    'Set Password ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16,),
                  Text(
                    textAlign: TextAlign.start,
                    'Minimum length password 8 character with Letter and number combination ',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12,),

                  FilledButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationScreen()));
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
