import 'package:alnabekapp/components/appbar.dart';
import 'package:flutter/material.dart';

class EditShawarma extends StatefulWidget {
  const EditShawarma({super.key});

  @override
  State<EditShawarma> createState() => _EditShawarmaState();
}

class _EditShawarmaState extends State<EditShawarma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "Editar Shawarma", false),
      
    );
  }
}