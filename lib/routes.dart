import 'package:flutter/material.dart';
import 'package:alnabekapp/screens/src1_portada.dart';
// import 'package:alnabekapp/screens/src2.dart';
// import 'package:alnabekapp/screens/src3.dart';
// import 'package:alnabekapp/screens/src4.dart';
// import 'package:alnabekapp/screens/src5.dart';

Map <String, Widget Function(BuildContext)> rutasApp = {
  '/': (context) => const Portada(),
  // '/login': (context) => const PantallaDos(),
  // '/home': (context) => const PantallaTres(),
  // '/entrada': (context) => const PantallaCuatro(),
  // '/shawarma': (context) => const PantallaCinco(),
};