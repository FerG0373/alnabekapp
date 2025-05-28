import 'package:flutter/widgets.dart';

class AppScreenSize {
// Métodos para obtener el tamaño de la pantalla del dispositivo.
  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
  
  // Método para obtener el promedio del ancho y alto de la pantalla.
  static double getAverage(BuildContext context) {
    final double width = getWidth(context);
    final double height = getHeight(context);
    return (width + height) / 2;
  }
}