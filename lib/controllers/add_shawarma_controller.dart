import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/services/shawarma_service.dart';
import 'package:flutter/material.dart';

class AddShawarmaController {
  final TextEditingController nombreControlador;
  final TextEditingController descripcionControlador;
  final TextEditingController precioControlador;
  String? tipoSeleccionado;

  AddShawarmaController({
    required this.nombreControlador,
    required this.descripcionControlador,
    required this.precioControlador,
    this.tipoSeleccionado,
  });

  // Validación de campos. Retorna un mensaje de error si hay campos vacíos o si el precio no es válido. Si todo está bien retorna null.
  String? validarCampos() {
    if (nombreControlador.text.isEmpty || descripcionControlador.text.isEmpty || precioControlador.text.isEmpty || tipoSeleccionado == null) {
      return 'Por favor, completá todos los campos.';
    }
    final precio = double.tryParse(precioControlador.text);
    if (precio == null || precio <= 0) {
      return 'El precio debe ser un número válido y mayor que cero.';
    }
    return null; // Todos los campos son válidos.
  }

  Shawarma crearShawarma() {
    return Shawarma(
      id: 0,
      nombre: nombreControlador.text,
      descripcion: descripcionControlador.text,
      precio: double.parse(precioControlador.text),
      tipo: tipoSeleccionado!,
    );
  }

  Future<bool> guardarShawarma() async {
    final nuevoShawarma = crearShawarma();
    return await ShawarmaService().insertarShawarma(nuevoShawarma);
  }
}
