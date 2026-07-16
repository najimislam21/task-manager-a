import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_a/data/model/user_model.dart';

class AuthController {
  static String? accessToken;
  static UserModel? userData;

  // SharedPreferences er modhe choto choto data rakaha hy(token,)
  static Future saveUserDate(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user-data', jsonEncode(model.toJson()));

    accessToken = token;
    userData = model;
  }

  //  login er pore rerun krle abar login screen niye jai ei problem er jonno

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token != null) {
      accessToken = token;
    }

    String? user = sharedPreferences.getString('user-data');

    if (user != null && user.isNotEmpty) {
      userData = UserModel.fromJson(jsonDecode(user));
    }
  }

  static Future<bool> usUserLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    return token != null;
  }

  static Future<void> updateUserData(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user-data', jsonEncode(user.toJson()));
  }
}