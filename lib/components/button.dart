import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_screenSize.dart';
import 'package:alnabekapp/res/app_colors.dart';

class AppButton {

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
    VoidCallback onPressed,  // Recibe la función que ejecuta la validación.
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: SizedBox(
        width: AppScreenSize.getAverage(context) * 0.30,
        height: AppScreenSize.getAverage(context) * 0.06,
        child: ElevatedButton(
          onPressed: onPressed,
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


  // Método para el Botón Agregar.
  static Widget insertarBotonAgregar(BuildContext context, rutaImagen) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, rutaImagen);
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

  // Método para el botón Aceptar.
  static Widget insertarBotonAceptar(VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      child: Text("Aceptar"),
    );
  }
}