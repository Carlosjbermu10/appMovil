import 'package:shared_preferences/shared_preferences.dart';

import '../domain/user.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //dynamic tipoo = user.tipo;
    //dynamic numeroo = user.numero;
    dynamic emaill = user.email;
    //dynamic contratoo = user.contrato;
    dynamic tokenn = user.token;
    dynamic renewalTokenn = user.renewalToken;
    dynamic name = user.name;
    //prefs.setString('tipo', tipoo);
    //prefs.setString('name', numeroo);
    prefs.setString('email', emaill);
    //prefs.setString('contrato', contratoo);
    prefs.setString('token', tokenn);
    prefs.setString('token', renewalTokenn);
    prefs.setString('name', name);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? tipo = prefs.getString("tipo");
    String? numero = prefs.getString("numero");
    String? email = prefs.getString("email");
    String? contrato = prefs.getString("contrato");
    String? token = prefs.getString("token");
    String? renewalToken = prefs.getString("renewalToken");
    String? name = prefs.getString("name");

    return User(
        tipo: tipo,
        numero: numero,
        email: email,
        contrato: contrato,
        token: token,
        renewalToken: renewalToken,
        name: name);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('tipo');
    prefs.remove('numero');
    prefs.remove('email');
    prefs.remove('contrato');
    prefs.remove('token');
    prefs.remove('name');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    return token;
  }

  Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("name");
    return name;
  }
}
