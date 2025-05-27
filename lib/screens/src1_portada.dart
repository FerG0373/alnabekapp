import 'package:alnabekapp/components/app_buttons.dart';
import 'package:alnabekapp/res/app_images.dart';
import 'package:flutter/material.dart';

class Portada extends StatelessWidget {

  const Portada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.portada),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Botón
          AppButtons.ingresarBotonPortada(context),
        ],
      ),
    );
  }
}
