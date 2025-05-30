import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_colors.dart';

class Appbars {

  // Método para generar las AppBar de la aplicación.
  static AppBar insertarAppBar(BuildContext context, String texto, bool botonHamburguesa) {
    return AppBar(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.foreground,
      title: Text(
        texto,
        style: const TextStyle(
          color: AppColors.foreground,
          fontWeight: FontWeight.bold,
        )
      ),
      actions: botonHamburguesa ? [
        IconButton(
            icon: const Icon(Icons.menu), // Ícono hamburguesa
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('')),
              );
            },
        ),
      ] : null
    );
  }
}