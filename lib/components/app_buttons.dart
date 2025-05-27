import 'package:flutter/material.dart';

class AppButtons {

  // Método para el botón Ingresar de la portada.
  static Widget ingresarBotonPortada(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text("Ingresar"),
        ),
      ),
    );
  }

  

}
