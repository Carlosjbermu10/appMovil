import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../domain/user.dart';
import '../utility/app_url.dart';
import '../utility/shared_preference.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<FutureOr> register(String? tipo, String? numero, String? email,
      String? password, String? passwordConfirmation) async {
    final Map<String, dynamic> apiBodyData = {
      'tipo': tipo,
      'numero': numero,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    var url = Uri.parse(AppUrl.register);

    // flutter run -d chrome --web-browser-flag "--disable-web-security"

    return await http
        .post(url, body: json.encode(apiBodyData), headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods":
              "POST, GET, OPTIONS, PUT, DELETE, HEAD",
        })
        .then(onValue)
        .catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onValue(Response response) async {
    Map<dynamic, Object> result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if (response.statusCode == 200) {
      //esta parte del "if" no se puede comprobar ya que no se puede registrar como tal por razones del backend
      var userData = responseData['data'];

      // now we will create a user model
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Registrado exitosamente',
        'data': authUser
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

  Future<Map<String, dynamic>> login(String? email, String? password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    //Peticion Post para el Login
    var url_login = Uri.parse(AppUrl.login);

    Response response = await post(
      url_login,
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
        'X-ApiKey': 'ZGlzIzEyMw=='
      },
    );

    final Map<String, dynamic> responseDataLogin = json.decode(response.body);
    print(responseDataLogin);

    //Peticion Get para deudas
    var url_deudas = Uri.parse(AppUrl.deudas);

    var tokeeeen = responseDataLogin['token'];

    Response responseDeudas = await get(
      url_deudas,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $tokeeeen",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      },
    );

    final Map<String, dynamic> responseDataDeudas =
        json.decode(responseDeudas.body);
    print(responseDataDeudas['resumen_deudas'][1]['nombre']);

    // flutter run -d chrome --web-browser-flag "--disable-web-security"

    if (responseDeudas.statusCode == 200) {
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      return result = {
        'status': false,
        'message': 'ERRORRRRRRRRRR',
        'data': responseDataDeudas
      };
    }

    if (response.statusCode == 200) {
      //Falta essta parte que es cuando el login es correcto

      Map<String, dynamic> userData = {
        'email': email,
        'token': responseDataLogin['token'],
        'name': responseDataDeudas['resumen_deudas'][1]['nombre'],
      };

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': 'ERRORRRRRRRRRR',
        'data': responseDataLogin
      };
    }

    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Solicitud fallida', 'data': error};
  }
}
