import 'package:flutter/material.dart';
import 'package:alnabekapp/components/appbars.dart';
import 'package:alnabekapp/components/imagecards.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/res/app_screenSize.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    // ?? devuelve el valor de la izquierda si no es null, sino, devuelve el de la derecha.
    String datorecibido = ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuario';
    String saludo = '¡Bienvenido $datorecibido!';
    // Espacio entre tarjetas
    SizedBox espacio = SizedBox(height: AppScreenSize.getHeight(context) * 0.006);

    return Scaffold(
      // AppBar
      appBar: Appbars.insertarAppBar(context, saludo, true),

      body: Column(
          children: [
            // Espacio entre tarjetas.
            espacio,
            // Menú
            AppImageCards.insertarMenuPortada(context, AppImages.menu, 'Menú'),
            // Espacio entre tarjetas.
            espacio,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Entrada.
                AppImageCards.insertarItem(context, '/entrada', AppImages.entrada, 'Entrada'),
                // Shawarma.
                AppImageCards.insertarItem(context, '/shawarma', AppImages.shawarma, 'Shawarma'),                
              ]
            ),
            // Espacio entre tarjetas.
            espacio,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Fatay.
                AppImageCards.insertarItem(context, '', AppImages.fatay, 'Fatay'),
                // Vegetariano.
                AppImageCards.insertarItem(context, '', AppImages.vegetariano, 'Vegetariano'),
              ],
            ),
            // Espacio entre tarjetas.
            espacio,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Postres.
                AppImageCards.insertarItem(context, '', AppImages.baklava, 'Postres'),
                // Bebida.
                AppImageCards.insertarItem(context, '', AppImages.bebida, 'Bebida'),
              ]
            )
          ],
      )
    );
  }
}