import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';
import 'package:oficina_datalink/Widgets/image_widget.dart';
import 'package:oficina_datalink/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../domain/user.dart';
import '../providers/user_provider.dart';
import '../responsive.dart';
import '../utility/validator_email.dart';
import '../utility/validator_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  bool bandera1 = true;
  bool bandera2 = true;

  String? _cedulaValues = "";
  String? _emailValues = "";
  String? _passwordValues = "";
  String? _password2Values = "";
  String dropdownValue = 'V'; // valor inicial de dropdown

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const ImageWidget(space: 30),
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
                  child: Column(children: [
                    Text(
                      'REGISTRARSE',
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
                        child: Column(children: [
                          DropdownButtonFormField(
                            //inicio del dropdown, buscar como sacar datos compatibles con la api
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white54)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>['V', 'E', 'J', 'G', 'P', 'C']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style:
                                      TextStyle(fontSize: responsive.ip(1.4)),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Rif / Cédula',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white54)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.number,
                            onSaved: (value) => _cedulaValues = value,
                            validator: (value) =>
                                value!.isEmpty ? "Ingresar Rif / Cédula" : null,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Correo electrónico',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white54)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) => _emailValues = value,
                            validator: validateEmail,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFormField(
                            obscureText: bandera1,
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: IconButton(
                                    onPressed: () {
                                      _chancebool1();
                                    },
                                    icon: Icon(
                                      bandera1
                                          ? Icons.visibility_off
                                          : Icons.visibility_rounded,
                                    ),
                                  ),
                                ),
                                hintText: 'Contraseña',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white54)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            onSaved: (value) => _passwordValues = value,
                            validator: validatePassword,
                          ),
                          SizedBox(height: responsive.hp(2)),
                          TextFormField(
                            obscureText: bandera2,
                            decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child: IconButton(
                                    onPressed: () {
                                      _chancebool2();
                                    },
                                    icon: Icon(
                                      bandera2
                                          ? Icons.visibility_off
                                          : Icons.visibility_rounded,
                                    ),
                                  ),
                                ),
                                hintText: 'Confirmar Contraseña',
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.white)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.white54)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            onSaved: (value) => _password2Values = value,
                            validator: (value) => value!.isEmpty
                                ? "Volver a ingresar Contraseña"
                                : null,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: responsive.hp(2)),
                            child: CustomButton(
                                text: 'Registrarse',
                                prueba: 1,
                                onTap: () {
                                  _register(context);
                                }),
                          ),
                        ]),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? tipo = "";
  void _register(BuildContext context) {
    final form = formKey.currentState;
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    if (dropdownValue == "V") {
      tipo = "1";
    } else if (dropdownValue == "E") {
      tipo = "2";
    } else if (dropdownValue == "J") {
      tipo = "3";
    } else if (dropdownValue == "G") {
      tipo = "4";
    } else if (dropdownValue == "P") {
      tipo = "5";
    } else if (dropdownValue == "C") {
      tipo = "6";
    }
    if (form!.validate()) {
      form.save();
      print(dropdownValue);
      if (_passwordValues!.endsWith(_password2Values!)) {
        // creamos los provider
        auth
            .register(tipo, _cedulaValues, _emailValues, _passwordValues,
                _password2Values)
            .then((response) {
          dynamic? responsee = response;
          print(responsee);
          if (responsee != null) {
            if (responsee['status']) {
              //las 3 lineas siguientes no se puede comprobar ya que no se puede registar en el backend
              User user = responsee['data'];
              Provider.of<UserProvider>(context).setUser(user);
              Navigator.pop(context);
            } else {
              Flushbar(
                title: "Registro fallido",
                message: responsee['data']['message'].toString(),
                duration: const Duration(seconds: 5),
              ).show(context);
            }
          }
        });
      } else {
        Flushbar(
          title: "Contraseñas diferentes",
          message: "Por favor ingrese una contraseña de confirmación válida",
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    } else {
      Flushbar(
        title: "Registar inválido",
        message: "Por favor complete todos los campos correctamente",
        duration: const Duration(seconds: 3),
      ).show(context);
    }
  }

  void _chancebool1() {
    setState(() {
      bandera1 = !bandera1;
    });
  }

  void _chancebool2() {
    setState(() {
      bandera2 = !bandera2;
    });
  }
}
