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
                color: AppColors.buttonText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Método para el botón Iniciar Sesión.
  static Widget insertarBotonLogin(
    BuildContext context,
    TextEditingController controlador,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: SizedBox(
        width: AppScreenSize.getAverage(context) * 0.30,
        height: AppScreenSize.getAverage(context) * 0.06,
        child: ElevatedButton(
          onPressed: () {
            // Captura el valor cuando se presiona el botón y no antes. Trim() es para borrar espacios accidentales.
            final nombreUsuario = controlador.text.trim();
            Navigator.pushNamed(context, "/home", arguments: nombreUsuario);
          },
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(
              fontSize: AppScreenSize.getAverage(context) * 0.025,
              color: AppColors.titleText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Método para Botón Agregar.
  static Widget insertarBotonAgregar(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, "/addShawarma");
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Image.asset(
      'assets/img/add_icon.png',
      height: 40,
      width: 40,
      fit: BoxFit.cover,
      ),
    );
  }
}
