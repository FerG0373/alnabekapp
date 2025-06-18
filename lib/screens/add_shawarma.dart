import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/dropdown.dart';
import 'package:alnabekapp/components/textfield.dart';
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
              AppTextFields.insertarTextFormField(40, "Nombre"),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Descripción"),
              const SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Precio"),
              const SizedBox(height: 20),
              AppDropDown.insertarDropDown(['Carne', 'Pollo', 'Mixto', 'Falafel', 'Al Nabek', 'Al plato']),
              const SizedBox(height: 100),
              AppButton.insertarBotonAceptar(),
            ],
          ),
        ),
      ),
    );
  }
}
