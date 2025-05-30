import 'package:flutter/material.dart';
import 'package:alnabekapp/routes.dart';

void main() => runApp(const AlNabekApp());

class AlNabekApp extends StatelessWidget {
  const AlNabekApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al Nabek App',
      initialRoute: '/',
      routes: rutasApp,
      debugShowCheckedModeBanner: false,
    );
  }
}