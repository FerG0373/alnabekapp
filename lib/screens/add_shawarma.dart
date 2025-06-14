import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/dropdown.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:flutter/material.dart';

class AddShawarma extends StatelessWidget {
  const AddShawarma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "Agregar Shawarma", false),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFields.insertarTextFormField(40, "Nombre"),
              SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Descripción"),
              SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Precio"),
              SizedBox(height: 20),
              AppDropDown.insertarDropDown(['Carne', 'Pollo', 'Mixto', 'Falafel', 'Al Nabek', 'Al plato']),
            ],
          ),
        ),
      ),
    );
  }
}
