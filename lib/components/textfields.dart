import 'package:flutter/material.dart';

class AppTextFields {
  // Método para crear los campos de texto.
  static Widget insertarCampoTexto(BuildContext context, String titulo, bool valor) {
    return TextField(
      decoration: InputDecoration(
        labelText: titulo,
        border: OutlineInputBorder()
      ),
      obscureText: valor,
    );
  }
}
