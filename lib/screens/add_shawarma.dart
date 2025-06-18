import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/dropdown.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/services/shawarma_service.dart';
import 'package:flutter/material.dart';

class AddShawarma extends StatefulWidget {
  const AddShawarma({super.key});

  @override
  State<AddShawarma> createState() => _AddShawarmaState();
}

class _AddShawarmaState extends State<AddShawarma> {

  final TextEditingController _nombreControlador = TextEditingController();
  final TextEditingController _descripcionControlador = TextEditingController();
  final TextEditingController _precioControlador = TextEditingController();
  String? _tipoSeleccionado;

  void guardarShawarma() async {
    if (_nombreControlador.text.isEmpty ||
        _descripcionControlador.text.isEmpty ||
        _precioControlador.text.isEmpty ||
        _tipoSeleccionado == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Por favor, completá todos los campos')),
          );
          return;
      }

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    final nuevoShawarma = Shawarma(
      id: 0,
      nombre: _nombreControlador.text,
      descripcion: _descripcionControlador.text,
      precio: double.tryParse(_precioControlador.text) ?? 0.0,
      tipo: _tipoSeleccionado!.toLowerCase(),
    );

    final shawarmaCreado = await ShawarmaService().insertarShawarma(nuevoShawarma);

    if (shawarmaCreado) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Shawarma agregado con éxito')),
      );
      navigator.pop();
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Error al agregar Shawarma')),
      );
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
              AppTextFields.insertarTextFormField(40, "Nombre", _nombreControlador),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Descripción", _descripcionControlador),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Precio", _precioControlador),
              const SizedBox(height: 20),
              AppDropDown.insertarDropDown(['Carne', 'Pollo', 'Mixto', 'Falafel', 'Al Nabek', 'Al plato'],
                selectedValue: _tipoSeleccionado,
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _tipoSeleccionado = nuevoValor;
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
