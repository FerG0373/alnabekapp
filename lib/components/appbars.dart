import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_colors.dart';

class Appbars {

  // Método para generar las AppBar de la aplicación.
  static AppBar insertarAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.foreground,
    );
  }
}