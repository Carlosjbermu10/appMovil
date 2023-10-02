import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';
import 'package:oficina_datalink/Widgets/image_widget.dart';
import 'package:oficina_datalink/Widgets/registertext_widget.dart';
import 'package:provider/provider.dart';
import '../providers/recovery_password_provider.dart';
import '../responsive.dart';
import '../utility/validator_email.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  final formKey = GlobalKey<FormState>();

  String? _emailValues = "";

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
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        width: responsive.wp(85),
                        height: responsive.hp(25),
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
                                '¿Cómo recuperar su contraseña?',
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
                                  'Si olvidó su contraseña y desea recuperarla. Ingrese al correo asociado a la cuenta y recibirá un enlace al que podrá acceder y cambiar su contraseña. ',
                                  style:
                                      TextStyle(fontSize: responsive.ip(1.7)),
                                  textAlign: TextAlign.justify),
                            ),
                          )
                        ]),
                      ),
                      SizedBox(height: responsive.hp(5)),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(10)),
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Correo Electrónico',
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
                                  keyboardType: TextInputType.emailAddress,
                                  onSaved: (value) => _emailValues = value,
                                  validator: validateEmail,
                                ),
                                SizedBox(height: responsive.hp(5)),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        text: 'Enviar',
                                        prueba: 2,
                                        onTap: () {
                                          _recoverPassword(context);
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
                                SizedBox(height: responsive.hp(3)),
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

  void _recoverPassword(BuildContext context) {
    final form = formKey.currentState;
    RecoveryPasswordProvider recovery =
        Provider.of<RecoveryPasswordProvider>(context, listen: false);
    if (form!.validate()) {
      form.save();
      recovery.recoveryPassword(_emailValues).then((response) {
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
                  title: const Text('Correo Enviado'),
                  content: SingleChildScrollView(
                    child: Text(mensaje),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Aceptar'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    )
                  ],
                );
              });
        } else {
          Flushbar(
            title: "Proceso de recuperar Contraseña fallido",
            message: responsee['data']['message'].toString(),
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
}
