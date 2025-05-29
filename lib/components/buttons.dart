import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_screenSize.dart';
import 'package:alnabekapp/res/app_colors.dart';

class AppButtons {

  // Método para el botón Ingresar de la portada.
  static Widget insertarBotonPortada(BuildContext context) {    
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: SizedBox(
          width: AppScreenSize.getAverage(context) * 0.2,
          height: AppScreenSize.getAverage(context) * 0.06,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              "Ingresar",
              style: TextStyle(
                fontSize: AppScreenSize.getAverage(context) * 0.025,
                color: AppColors.background,
              )
            ),
          ),
        ),
      ),
    );
  }
  
  // Método para el botón Ingresar de la pantalla de login.
  static Widget insertarBotonLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: SizedBox(
        width: AppScreenSize.getAverage(context) * 0.30,
        height: AppScreenSize.getAverage(context) * 0.06,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(
              fontSize: AppScreenSize.getAverage(context) * 0.025,
              color: AppColors.background
            )
          )
        )
      )
    );
  }
  
}
