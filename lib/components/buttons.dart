import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_screenSize.dart';
import 'package:alnabekapp/res/app_colors.dart';

class AppButtons {

  // Método para el botón Ingresar de la portada.
  static Widget insertarBotonPortada(BuildContext context) {    
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 75),
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
                fontWeight: FontWeight.bold
              )
            ),
          ),
        ),
      ),
    );
  }
  
  // Método para el botón Iniciar Sesión.
  static Widget insertarBotonLogin(BuildContext context, String nombreUsuario) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: SizedBox(
        width: AppScreenSize.getAverage(context) * 0.30,
        height: AppScreenSize.getAverage(context) * 0.06,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home", arguments: nombreUsuario);
          },
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(
              fontSize: AppScreenSize.getAverage(context) * 0.025,
              color: AppColors.background,
              fontWeight: FontWeight.bold
            )
          )
        )
      )
    );
  }
  
}
