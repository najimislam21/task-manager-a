import 'package:flutter/material.dart';
import 'package:task_manager_a/screens/authentication_screen/log_in_screen.dart';
import 'package:task_manager_a/screens/authentication_screen/set_password_screen.dart';
import 'package:task_manager_a/utils/app_colors.dart';
import 'package:task_manager_a/widget/screen_bg.dart';
import 'package:flutter/gestures.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  void onTapSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
  }
 final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter email';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter firstName';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter lastName';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: mobileController,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter mobile';
                        }else if(
                          value.length != 11){
                            return 'Please enter correct number';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please enter password';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 12,),


                    FilledButton(onPressed: (){
                      if(formKey.currentState!.validate()){

                      }
                    }, child:Icon(Icons.arrow_circle_right,size: 24)),

                    SizedBox(height: 60),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 12),
                          RichText(
                            text: TextSpan(
                              text: "Have an Account?",
                              style: TextStyle(fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sing In',
                                  style: TextStyle( fontWeight: FontWeight.w500,
                                    color: AppColors.PColor,
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap = onTapSignIn,
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
