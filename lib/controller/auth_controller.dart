import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_a/data/model/user_model.dart';

class AuthController {
  static String ? accessToken;
  static UserModel ? userData;


  // SharedPreferences er modhe choto choto data rakaha hy(token,)
  static Future saveUserDate(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));

    accessToken = token;
    userData = model;

  }
}