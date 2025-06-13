import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_screenSize.dart';

class AppTextFields {
  // Método para crear los campos de texto.
  static Widget insertarTextField(
    BuildContext context,
    String titulo,
    bool valor,
    TextEditingController controlador,
  ) {
    return SizedBox(
      width: AppScreenSize.getAverage(context) * 0.8,
      height: AppScreenSize.getAverage(context) * 0.08,
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: titulo,
          border: OutlineInputBorder(),
        ),
        obscureText: valor,
      ),
    );
  }

  // Método para crear campos de texto de formularios.
  static Widget insertarTextFormField(int longitudMax, String textoEtiqueta) {
    return TextFormField(
      maxLength: longitudMax,
      decoration: InputDecoration(
        labelText: textoEtiqueta
      ),
    );
  }
}
