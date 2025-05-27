import 'package:flutter/material.dart';

class Portada extends StatelessWidget {

  const Portada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/portada.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Botón
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Ingresar")
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
