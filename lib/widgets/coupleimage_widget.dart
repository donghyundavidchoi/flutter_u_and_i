import 'package:flutter/material.dart';

class CoupleImage extends StatelessWidget {
  const CoupleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/img/middle_image.png',
        height: MediaQuery.of(context).size.height * 0.5,
      ),
    );
  }
}
