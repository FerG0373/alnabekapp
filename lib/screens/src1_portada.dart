import 'package:flutter/material.dart';

class Portada extends StatelessWidget {
  const Portada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/portada.png'),
            fit: BoxFit.fill,
          )
        )
      )
    );
  }
}