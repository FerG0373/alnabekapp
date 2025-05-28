import 'package:alnabekapp/components/textfields.dart';
import 'package:flutter/material.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/components/appbars.dart';
import 'package:alnabekapp/res/app_screenSize.dart';
import 'package:alnabekapp/components/texts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: Appbars.instertarLoginAppBar(context),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  // Logo
                  Image.asset(AppImages.logo, width: AppScreenSize.getAverage(context) * 0.4, height: AppScreenSize.getAverage(context) * 0.4),
        
                  // Espacio entre logo y título.
                  const SizedBox(height: 20),
        
                  // Texto de Bienvenida.
                  AppTexts.insertarTextoBienvenida(context),
        
                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        // Campo de texto Usuario.
                        AppTextFields.insertarCampoTexto(context, "Usuario", false),        
                      
                        const SizedBox(height: 15),
              
                        // Campo de texto Contraseña.
                        AppTextFields.insertarCampoTexto(context, "Contraseña", true),
                      ],
                    ),
                  ),

                  // Botón Iniciar Sesión.
                  
                ],
              )
            )
          ]
        ),
      )
    );
  }
}