import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../domain/user.dart';
import '../utility/app_url.dart';
import '../utility/shared_preference.dart';

class LogoutProvider extends ChangeNotifier {
  Future<FutureOr> logout() async {
    var result;
    String? token = "";

    var url = Uri.parse(AppUrl.logout);

    token = await UserPreferences().getToken();

    try {
      return await http
          .post(url, headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            "Authorization": "Bearer $token",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods":
                "POST, GET, OPTIONS, PUT, DELETE, HEAD",
          })
          .then(onValue)
          .catchError(onError);
    } catch (e) {
      print(e);
    }
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(Response response) async {
    Map<dynamic, Object>? result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if (response.statusCode == 200) {
      UserPreferences().removeUser();

      result = {
        'status': true,
        'message': 'Sesion cerrada exitosamente',
      };
    } else {
      result = {
        'status': false,
        'message': 'ERRORRRRRRRRRR',
        'data': responseData
      };
    }
    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Solicitud fallida', 'data': error};
  }
}
