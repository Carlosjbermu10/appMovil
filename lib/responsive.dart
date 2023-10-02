import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  final double width, height, inch;

  Responsive({required this.width, required this.height, required this.inch});

  factory Responsive.of(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final inch = math.sqrt(math.pow(size.width, 2) + math.pow(size.height, 2));
    return Responsive(width: size.width, height: size.height, inch: inch);
  }

  double wp(double percent) => width * percent / 100;
  double hp(double percent) => height * percent / 100;
  double ip(double percent) => inch * percent / 100;
}

/*
para usar esta clases 
importar 
 colocar 
 final Responsive responsive = Responsive.of(context);
 responive.ip/hp/wp

*/ 
