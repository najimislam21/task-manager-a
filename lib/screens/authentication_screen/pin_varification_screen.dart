import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/authentication_screen/sign_up_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  void onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PinVerificationScreen()),
    );
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
                    'PIN Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  Text(
                    textAlign: TextAlign.start,
                    'A 6 Digit verification pin will send to your email address',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: (List.generate(
                      4,
                      (index) => SizedBox(
                        width: 60,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )),
                  ),
                  SizedBox(height: 12),

                  FilledButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right, size: 24),
                  ),

                  SizedBox(height: 80),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Don't Have an Account",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),

                            children: [
                              TextSpan(
                                text: 'Sing Up',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.PColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = onTapSignUp,
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
