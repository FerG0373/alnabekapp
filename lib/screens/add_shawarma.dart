import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/textfield.dart';
import 'package:flutter/material.dart';

class AddShawarma extends StatelessWidget {
  const AddShawarma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "Agregar producto", false),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextFields.insertarTextFormField(40, "Ingresar nombre"),
              SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Ingresar precio"),
              SizedBox(height: 20),
              AppTextFields.insertarTextFormField(40, "Ingresar tipo"),
            ],
          ),
        ),
      ),
    );
  }
}
