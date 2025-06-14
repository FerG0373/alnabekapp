import 'package:flutter/material.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/res/app_imagespath.dart';

class PortadaScreen extends StatelessWidget {

  const PortadaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo.
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.portada),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Botón.
          AppButton.insertarBotonPortada(context),
          
        ],
      ),
    );
  }
}
