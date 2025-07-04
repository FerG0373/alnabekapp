import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/dropdown.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:alnabekapp/controllers/add_shawarma_controller.dart';
import 'package:flutter/material.dart';

class AddShawarma extends StatefulWidget {
  const AddShawarma({super.key});

  @override
  State<AddShawarma> createState() => _AddShawarmaState();
}

class _AddShawarmaState extends State<AddShawarma> {

  // Instancia del controlador para manejar la lógica de agregar un Shawarma.
  late final AddShawarmaController _controladores;

  // Inicialización del controlador en el método initState.
  @override
  void initState() {
    super.initState();
    // Llamada al constructor del controlador con los controladores de texto y el tipo seleccionado.
    _controladores = AddShawarmaController(
      nombreControlador: TextEditingController(),
      descripcionControlador: TextEditingController(),
      precioControlador: TextEditingController(),
    );
  }

  void _mostrarMensaje(String mensaje) {
    // Verifica si el widget está montado antes de mostrar el mensaje.
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  Future<void> guardarShawarma() async{
    final error = _controladores.validarCampos();
    if(error != null) {
      _mostrarMensaje(error);
      return; // Si hay un error de validación, muestra el mensaje y no continúa.
    }

    try {
      final shawarmaCreado = await _controladores.guardarShawarma();
      if(shawarmaCreado) {
        _mostrarMensaje('Shawarma agregado con éxito.');
        if(mounted) Navigator.of(context).pop(); // Cierra la pantalla actual si el widget sigue montado.  
      } else {
        _mostrarMensaje('Error al agregar Shawarma.');
      }
    } catch(e) {
      _mostrarMensaje('Error inesperado: ${e.toString()}');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "Agregar Shawarma", false),
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
                }
              ),
              const SizedBox(height: 100),
              AppButton.insertarBotonAceptar(() { guardarShawarma(); }),
            ],
          ),
        ),
      ),
    );
  }
}
