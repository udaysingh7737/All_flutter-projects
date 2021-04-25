import 'package:flutter/material.dart';

class BgImage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/cs.jpg",
    fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.5),
      colorBlendMode: BlendMode.darken,
    );
  }
}
