import 'package:flutter/material.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';
import 'package:oficina_datalink/Widgets/image_widget.dart';
import '../responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _CustomBody(),
      ),
    );
  }
}

class _CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const ImageWidget(space: 60), _ButtonsWidget()],
    );
  }
}

class _ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: responsive.hp(40),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 136, 206, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'BIENVENIDOS',
                  style: TextStyle(
                      fontSize: responsive.ip(3.5),
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: responsive.hp(2)),
                child: CustomButton(
                    text: 'Iniciar Sesión',
                    prueba: 1,
                    onTap: () => Navigator.pushNamed(context, '/login')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: responsive.hp(1)),
                child: CustomButton(
                    text: 'Registrarse',
                    prueba: 1,
                    onTap: () => Navigator.pushNamed(context, '/register')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
