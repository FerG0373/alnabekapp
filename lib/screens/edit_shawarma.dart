import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/dropdown.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/controllers/edit_shawarma_controller.dart';

class EditShawarma extends StatefulWidget {
  final Shawarma shawarmaOriginal; // Objeto Shawarma a editar.

  const EditShawarma({super.key, required this.shawarmaOriginal});

  @override
  State<EditShawarma> createState() => _EditShawarmaState();
}

class _EditShawarmaState extends State<EditShawarma> {
  late final EditShawarmaController _controladores;

  @override
  void initState() {
    super.initState();
    // Llamada al constructor del controlador con los controladores de texto y el tipo seleccionado.
    _controladores = EditShawarmaController(
      nombreControlador: TextEditingController(),
      descripcionControlador: TextEditingController(),
      precioControlador: TextEditingController(),
    );
    _controladores.cargarDatos(widget.shawarmaOriginal); // Precarga los datos originales
  }

  void _mostrarMensaje(String mensaje) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  Future<void> guardarCambios() async {
    final actualizado = await _controladores.guardarCambios(
      widget.shawarmaOriginal.id,
      widget.shawarmaOriginal,
    );

    if (actualizado) {
      _mostrarMensaje('Shawarma actualizado con éxito.');
      if (mounted) Navigator.of(context).pop(); // Regresa a la pantalla anterior
    } else {
      _mostrarMensaje('NO se realizaron cambios.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "Editar Shawarma", false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFields.insertarTextFormField(40, "Nombre", _controladores.nombreControlador),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(100, "Descripción", _controladores.descripcionControlador),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Precio", _controladores.precioControlador, keyboardType: TextInputType.number),
              const SizedBox(height: 20),
              AppDropDown.insertarDropDown(['Carne', 'Pollo', 'Mixto', 'Vegetariano', 'Al Nabek', 'Al plato'],
                selectedValue: _controladores.tipoSeleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _controladores.tipoSeleccionado = nuevoValor;
                  });
                },
              ),
              const SizedBox(height: 100),
              AppButton.insertarBotonAceptar(() { guardarCambios(); }),
            ],
          ),
        ),
      ),
    );
  }
}
