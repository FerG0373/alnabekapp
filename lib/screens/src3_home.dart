import 'package:flutter/material.dart';
import 'package:alnabekapp/components/appbars.dart';
// import 'package:alnabekapp/res/app_screenSize.dart';
// import 'package:alnabekapp/res/app_imagespath.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    String datorecibido = ModalRoute.of(context)!.settings.arguments as String;
    String saludo = '¡Bienvenido $datorecibido!';

    return Scaffold(
      // AppBar
      appBar: Appbars.insertarAppBar(context, saludo),
    );
  }
}