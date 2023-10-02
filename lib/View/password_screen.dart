import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';
import 'package:oficina_datalink/Widgets/image_widget.dart';
import 'package:provider/provider.dart';
import '../providers/change_password_provider.dart';
import '../responsive.dart';
import '../utility/validator_password.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final formKey = GlobalKey<FormState>();

  bool bandera1 = true;
  bool bandera2 = true;
  bool bandera3 = true;

  String? _passwordActual = "";
  String? _passwordValues = "";
  String? _password2Values = "";

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
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        width: responsive.wp(85),
                        height: responsive.hp(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(children: [
                          SizedBox(
                            height: responsive.hp(3.5),
                          ),
                          Flexible(
                            child: SizedBox(
                              child: Text(
                                'Cambio de contraseña',
                                style: TextStyle(
                                    fontSize: responsive.ip(2),
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: responsive.hp(2),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: responsive.wp(75),
                              child: Text(
                                  'Si desea cambiar su contraseña, ingrese su contraseña actual, luego la nueva contraseña y confirme la misma.',
                                  style:
                                      TextStyle(fontSize: responsive.ip(1.7)),
                                  textAlign: TextAlign.justify),
                            ),
                          )
                        ]),
                      ),
                      SizedBox(height: responsive.hp(3)),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(10)),
                            child: Column(
                              children: [
                                TextFormField(
                                  obscureText: bandera1,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 4, 0),
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
                                      hintText: 'Contraseña Actual',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white54)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                  onSaved: (value) => _passwordActual = value,
                                  validator: validatePassword,
                                ),
                                SizedBox(height: responsive.hp(2.5)),
                                TextFormField(
                                  obscureText: bandera2,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 4, 0),
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
                                      hintText: 'Nueva contraseña',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                SizedBox(height: responsive.hp(2.5)),
                                TextFormField(
                                  obscureText: bandera3,
                                  decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 4, 0),
                                        child: IconButton(
                                          onPressed: () {
                                            _chancebool3();
                                          },
                                          icon: Icon(
                                            bandera3
                                                ? Icons.visibility_off
                                                : Icons.visibility_rounded,
                                          ),
                                        ),
                                      ),
                                      hintText: 'Confirmar contraseña',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white54)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                  onSaved: (value) => _password2Values = value,
                                  validator: validatePassword,
                                ),
                                SizedBox(height: responsive.hp(4)),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        text: 'Aceptar',
                                        prueba: 2,
                                        onTap: () {
                                          _cambiar_password(context);
                                        },
                                      ),
                                      SizedBox(
                                        width: responsive.wp(5),
                                      ),
                                      CustomButton(
                                        text: 'Cancelar',
                                        prueba: 2,
                                        onTap: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
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

  void _cambiar_password(BuildContext context) {
    final form = formKey.currentState;
    ChangePasswordProvider change =
        Provider.of<ChangePasswordProvider>(context, listen: false);
    if (form!.validate()) {
      form.save();
      if (_passwordValues!.endsWith(_password2Values!)) {
        change
            .changePassword(_passwordActual, _passwordValues, _password2Values)
            .then((response) {
          dynamic? responsee = response;
          print(responsee);
          if (responsee['status']) {
            //Añade una interfaz(widget) donde se muestre que la contraseña se cambio exitosamente
            //para que no cambie de ventana cuando se cambie
            //el string que esta abajo es la varible donde se guarda el mensaje que tienes que mostrar
            String mensaje = responsee['message'].toString();
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cambio realizado'),
                    content: SingleChildScrollView(
                      child: Text(mensaje),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Aceptar'),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      )
                    ],
                  );
                });
          } else {
            Flushbar(
              title: "Cambio de contraseña fallido",
              message: responsee['data']['mensaje'].toString(),
              duration: const Duration(seconds: 5),
            ).show(context);
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
        title: "Cambio de contraseña inválido",
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

  void _chancebool3() {
    setState(() {
      bandera3 = !bandera3;
    });
  }
}
