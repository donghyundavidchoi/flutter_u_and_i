import 'package:flutter/material.dart';
import 'package:u_and_i/widgets/coupleimage_widget.dart';
import 'package:u_and_i/widgets/dday_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff50c9ff),
      body: SafeArea(
        top: true,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            DDay(),
            CoupleImage(),
          ],
        ),
      ),
    );
  }
}
