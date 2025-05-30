import 'package:alnabekapp/res/app_colors.dart';
import 'package:alnabekapp/res/app_screensize.dart';
import 'package:flutter/widgets.dart';

  class AppTexts {

    // Método para generar el texto de bienvenida en la pantalla de login.
    static Widget insertarTextoBienvenida(BuildContext context) {      
      return Text(
        "¡Bienvenidos!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.titleText,
          fontSize: AppScreenSize.getAverage(context) * 0.04,
          fontWeight: FontWeight.bold,
      ),
    );
  }
  
}