import 'package:flutter/material.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/res/app_screenSize.dart';
import 'package:alnabekapp/components/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controladores de los campos de texto.
  final TextEditingController userControlador = TextEditingController();
  final TextEditingController passwordControlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: Appbars.insertarAppBar(context, "", false),

      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    AppImages.logo,
                    width: AppScreenSize.getAverage(context) * 0.35,
                    height: AppScreenSize.getAverage(context) * 0.35,
                  ),
                  // Espacio entre logo y título.
                  const SizedBox(height: 20),
                  // Texto de Bienvenida.
                  AppTexts.insertarTextoBienvenida(context),
                  // Espacio entre el título y los campos.
                  const SizedBox(height: 30),
                  // Campos de texto.
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        // Campo de texto Usuario.
                        AppTextFields.insertarCampoTexto(context, "Usuario", false, userControlador,),
                        // Espacio entre campos.
                        const SizedBox(height: 10),
                        // Campo de texto Contraseña.
                        AppTextFields.insertarCampoTexto(context, "Contraseña", true, passwordControlador,),
                      ],
                    ),
                  ),
                  // Botón Iniciar Sesión.
                  AppButtons.insertarBotonLogin(context, userControlador),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Para liberar memoria.
  @override
  void dispose() {
    userControlador.dispose();
    passwordControlador.dispose();
    super.dispose();
  }
}
