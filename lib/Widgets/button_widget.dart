import 'package:flutter/material.dart';

import '../responsive.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double prueba;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    required this.prueba,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      width: responsive.ip(25) / prueba,
      height: responsive.ip(4),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor:
              const MaterialStatePropertyAll(Color.fromRGBO(255, 102, 0, 1)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
                fontSize: responsive.ip(2.5), fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
