import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_a/controller/auth_controller.dart';
import 'package:task_manager_a/data/model/user_model.dart';
import 'package:task_manager_a/screens/authentication_screen/sign_up_screen.dart';
import 'package:task_manager_a/screens/main_nav_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';

import '../../data/model/api_response.dart';
import '../../data/service/api_caller.dart';
import '../../utils/urls.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  void onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUpScreen()));
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signIn() async {
    final ApiResponse response = await ApiCaller.postRequest(url: TMUrls.loginURL,
      body: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    );
    if(response.isSuccess){
      // final Map<String, dynamic> json = jsonDecode(response.responseData);
      UserModel model = UserModel.fromJson(response.responseData['data']);

      String accessToken = response.responseData['token'];
      AuthController.saveUserDate(model, accessToken);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign In Success'),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data']),));

    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBg(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Form(
                key: formKey,
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
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12,),

                    FilledButton(onPressed: (){
                      signIn();
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
      ),
    );
  }
}

