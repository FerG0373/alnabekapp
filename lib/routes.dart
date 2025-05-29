import 'package:flutter/material.dart';
import 'package:alnabekapp/screens/src1_portada.dart';
import 'package:alnabekapp/screens/src2_login.dart';
import 'package:alnabekapp/screens/src3_home.dart';

// import 'package:alnabekapp/screens/src3.dart';
// import 'package:alnabekapp/screens/src4.dart';
// import 'package:alnabekapp/screens/src5.dart';

Map <String, Widget Function(BuildContext)> rutasApp = {
  '/': (context) => const PortadaScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  // '/entrada': (context) => const PantallaCuatro(),
  // '/shawarma': (context) => const PantallaCinco(),
};