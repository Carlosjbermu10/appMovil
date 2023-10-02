import 'package:flutter/material.dart';
import '../responsive.dart';

class TextRegisterwidget extends StatelessWidget {
  const TextRegisterwidget({
    super.key,
    required this.responsive,
  });

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/register'),
          child: Text(
            '¿No tienes cuenta? Regístrate',
            style: TextStyle(
                fontSize: (responsive.ip(1.7)),
                fontWeight: FontWeight.w600,
                color: Colors.white70),
          )),
    );
  }
}
