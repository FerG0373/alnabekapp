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

  // Usuarios válidos.
  final Map<String, String> usuariosValidos = {
    'Diego': '1234',
    'Fernando': '1234',
    'Gustavo': '1234',
  };

  // Método para validar credenciales.
  void _iniciarSesion(BuildContext context) {
    final usuario = userControlador.text.trim();
    final password = passwordControlador.text.trim();

    if (usuariosValidos.containsKey(usuario) && usuariosValidos[usuario] == password) {
      // Credenciales válidas.
      Navigator.pushReplacementNamed(context, '/home', arguments: usuario,); // Navega a la pantalla principal.
    } else {
      // Credenciales inválidas.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

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
                        AppTextFields.insertarTextField(context, "Usuario", false, userControlador,),
                        // Espacio entre campos.
                        const SizedBox(height: 10),
                        // Campo de texto Contraseña.
                        AppTextFields.insertarTextField(context, "Contraseña", true, passwordControlador,),
                      ],
                    ),
                  ),
                  // Botón Iniciar Sesión.
                  AppButton.insertarBotonLogin(context, () => _iniciarSesion(context),),
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
