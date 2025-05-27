import 'package:flutter/material.dart';
import 'package:alnabekapp/components/appbars.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: Appbars.instertarLoginAppBar(context),
      
      
    );
  }
}