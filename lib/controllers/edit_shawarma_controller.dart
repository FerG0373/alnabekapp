import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/services/shawarma_service.dart';
import 'package:flutter/material.dart';

class EditShawarmaController {
  final TextEditingController nombreControlador;
  final TextEditingController descripcionControlador;
  final TextEditingController precioControlador;
  String? tipoSeleccionado;

  EditShawarmaController({
    required this.nombreControlador,
    required this.descripcionControlador,
    required this.precioControlador,
    this.tipoSeleccionado,
  });

  // Método que carga los datos del Shawarma original en los controladres para que el usuario pueda ver y editar.
  void cargarDatos(Shawarma shawarmaOriginal) {
    nombreControlador.text = shawarmaOriginal.nombre;
    descripcionControlador.text = shawarmaOriginal.descripcion ?? ''; // Maneja el caso de descripción si es nulo.
    precioControlador.text = shawarmaOriginal.precio.toString();
    tipoSeleccionado = shawarmaOriginal.tipo;
  }

   Map<String, dynamic> obtenerCambios(Shawarma shawarmaOriginal) {
    final modificacion = <String, dynamic>{};

    if (nombreControlador.text != shawarmaOriginal.nombre) {
      modificacion['nombre'] = nombreControlador.text;
    }
    if (descripcionControlador.text != shawarmaOriginal.descripcion) {
      modificacion['descripcion'] = descripcionControlador.text;
    }
    if (precioControlador.text != shawarmaOriginal.precio.toString()) {
      modificacion['precio'] = double.parse(precioControlador.text);
    }
    if (tipoSeleccionado != shawarmaOriginal.tipo) {
      modificacion['tipo'] = tipoSeleccionado;
    }

    return modificacion;
  }

  Future<bool> guardarCambios(int shawarmaId, Shawarma shawarmaOriginal) async {
    // Verifica si hay cambios antes de proceder.
    final shawarmaModificado = Shawarma(
      id: shawarmaOriginal.id,
      nombre: nombreControlador.text,
      descripcion: descripcionControlador.text.isNotEmpty ? descripcionControlador.text : null, // Maneja el caso de descripción nula.
      precio: double.parse(precioControlador.text),
      tipo: tipoSeleccionado ?? shawarmaOriginal.tipo,
    );

    // Llama al servicio para actualizar el Shawarma.
    return await ShawarmaService().actualizarShawarma(shawarmaId, shawarmaModificado.toJson());
  }
}