import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_manager_a/controller/auth_controller.dart';
import 'package:task_manager_a/data/model/api_response.dart';

class ApiCaller {

  static Future<ApiResponse>getRequest({required String url}) async {
    Response response = await get(Uri.parse(url),

      headers: {
      'token' : AuthController.accessToken ?? ''
      }
    );
    print('URL=== $url');
    print('respons=== ${response.body}');

    if(response.statusCode == 200){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: true);
    }else{
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false, errorMassage: jsonDecode(response.body));
    }

  }


  static Future<ApiResponse>postRequest({required String url, Map<String, dynamic>?body}) async {
    Response response = await post(Uri.parse(url),

      headers: {
      'token' : AuthController.accessToken ?? '',
        'Content-Type' : 'application/json',
        'Accept' : 'application/json'
      },
      body: body != null ? jsonEncode(body) : null,
    );
    print('URL=== $url');
    print('respons=== ${response.body}');

    if(response.statusCode == 200 || response.statusCode == 401){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: true);
    }else{
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false, errorMassage: jsonDecode(response.body));
    }

  }
}