import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../domain/user.dart';
import '../utility/app_url.dart';
import '../utility/shared_preference.dart';

class ChangePasswordProvider extends ChangeNotifier {
  Future<FutureOr> changePassword(
      String? password1, String? password2, String? password3) async {
    var result;
    String? token = "";

    final Map<String, dynamic> changeData = {
      'contrasena': password1,
      'contrasena_nueva': password2,
      'contrasena_nueva_confirmacion': password3
    };

    var url = Uri.parse(AppUrl.cambiar_password);

    token = await UserPreferences().getToken();

    try {
      return await http
          .post(url, body: json.encode(changeData), headers: {
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
      /*var userData = responseData['data'];

      // now we will create a user model
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);*/

      result = {
        'status': true,
        'message': 'Contraseña cambiada exitosamente',
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
