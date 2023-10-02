import 'package:flutter/material.dart';
import '../responsive.dart';

class ImageWidget extends StatelessWidget {
  final double space;
  const ImageWidget({super.key, required this.space});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.hp(space),
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Image.asset('assets/splash.png'),
    );
  }
}
