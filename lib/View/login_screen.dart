import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';
import 'package:oficina_datalink/Widgets/image_widget.dart';
import 'package:oficina_datalink/Widgets/registertext_widget.dart';
import 'package:provider/provider.dart';
import '../domain/user.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../responsive.dart';
import '../utility/validator_email.dart';
import '../utility/validator_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? _emailValues = "";
  String? _passwordValues = "";

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const ImageWidget(
              space: 30,
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: responsive.hp(70),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 136, 206, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'INICIAR SESIÓN',
                        style: TextStyle(
                            fontSize: (responsive.ip(3.5)),
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: responsive.wp(10)),
                            child: Column(
                              children: [
                                _email(),
                                SizedBox(height: responsive.hp(3)),
                                _password(),
                                SizedBox(height: responsive.hp(3)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: responsive.hp(2)),
                                  child: CustomButton(
                                      text: 'Ingresar',
                                      prueba: 1,
                                      onTap: () {
                                        _login(context);
                                      }),
                                ),
                                SizedBox(height: responsive.hp(2)),
                                _recovery(context, responsive),
                                TextRegisterwidget(responsive: responsive),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FittedBox _recovery(BuildContext context, Responsive responsive) {
    return FittedBox(
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/recovery'),
          child: Text(
            '¿Olvidó su contraseña?',
            style: TextStyle(
                fontSize: (responsive.ip(1.7)),
                fontWeight: FontWeight.w600,
                color: Colors.white70),
          )),
    );
  }

  bool bandera = true;
  TextFormField _password() {
    return TextFormField(
      obscureText: bandera,
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: IconButton(
              onPressed: () {
                _chancebool();
              },
              icon: Icon(
                bandera ? Icons.visibility_off : Icons.visibility_rounded,
              ),
            ),
          ),
          hintText: 'Contraseña',
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white54)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white),
      onSaved: (value) => _passwordValues = value,
      validator: validatePassword,
    );
  }

  TextFormField _email() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Correo Electronico',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white54)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => _emailValues = value,
      validator: validateEmail,
    );
  }

  void _login(BuildContext context) {
    final form = formKey.currentState;
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    if (form!.validate()) {
      form.save();
      final Future<Map<String, dynamic>> respose =
          auth.login(_emailValues, _passwordValues);
      respose.then((response) {
        dynamic responsee = response;
        //print(responsee);
        if (responsee['status']) {
          User user = response['user'];
          Provider.of<UserProvider>(context, listen: false).setUser(user);
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Flushbar(
            title: "Login fallido",
            message: responsee['data']['error'].toString(),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
        //Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      Flushbar(
        title: "Login inválido",
        message: "Por favor complete todos los campos correctamente",
        duration: const Duration(seconds: 3),
      ).show(context);
    }
  }

  void _chancebool() {
    setState(() {
      bandera = !bandera;
    });
  }
}
