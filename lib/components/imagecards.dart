import 'package:alnabekapp/res/app_screensize.dart';
import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_colors.dart';
import 'package:alnabekapp/res/app_imagespath.dart';

class AppImageCards {

  static const TextStyle textStyle = TextStyle(
      shadows: [
        Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
        Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
        Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
        Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
      ],
      color: AppColors.cardText,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    );

  // Método para insertar la imagen de menú en la pantalla.
  static Widget insertarMenuCard(BuildContext context, String titulo) {    
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImages.menu),
          fit: BoxFit.cover,
        ),
      ),
      width: AppScreenSize.getWidth(context) * 0.99,
      height: AppScreenSize.getHeight(context) *  0.2,
      child: Center(
        child: Text(
          titulo,
          style: textStyle,
        )
      )
    );
  }
  // Método para insertar una tarjeta de imagen.
  static Widget insertarItemCard(BuildContext context, String rutaPantalla, String imagen, String titulo) {
    return GestureDetector(
      onTap: () {
        if(rutaPantalla == '') {
          showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(titulo),
              content: const Text('No hay stock.'),
              actions: <Widget> [
                TextButton(
                  onPressed:  () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                )
              ]
            )
          );
        } else {
          Navigator.pushNamed(context, rutaPantalla);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            image: AssetImage(imagen),
            fit: BoxFit.cover,
          )
        ),
        height: AppScreenSize.getHeight(context) * 0.21,
        width: AppScreenSize.getWidth(context) * 0.49,
        child: Center(
          child: Text(
            titulo,
            style: textStyle,
          ),
        ),
      )
    );
  }
}