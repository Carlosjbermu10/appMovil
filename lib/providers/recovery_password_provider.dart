import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../domain/user.dart';
import '../utility/app_url.dart';
import '../utility/shared_preference.dart';

class RecoveryPasswordProvider extends ChangeNotifier {
  Future<FutureOr> recoveryPassword(String? email) async {
    var result;
    String? token = "";

    final Map<String, dynamic> changeData = {'email': email};

    var url = Uri.parse(AppUrl.recuperar_password);

    try {
      return await http
          .post(url, body: json.encode(changeData), headers: {
            'Content-Type': 'application/json; charset=UTF-8',
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
        'message': 'Mensaje enviado a su correo',
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
