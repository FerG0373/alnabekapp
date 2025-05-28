import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_screenSize.dart';

class AppButtons {

  // Método para el botón Ingresar de la portada.
  static Widget insertarBotonPortada(BuildContext context) {
    
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: SizedBox(
          width: AppScreenSize.getAverage(context) * 0.25,
          height: AppScreenSize.getAverage(context) * 0.06,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text("Ingresar"),
          ),
        ),
      ),
    );
  }
}
