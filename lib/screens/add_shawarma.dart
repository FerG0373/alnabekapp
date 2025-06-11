import 'package:alnabekapp/components/appbar.dart';
import 'package:flutter/material.dart';

class AddShawarma extends StatelessWidget {
  const AddShawarma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, "", false),
      body: Center(
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            TextFormField(),
            
          ],
        )
      ),
    );
  }
}
