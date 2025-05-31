import 'package:flutter/material.dart';
import 'package:alnabekapp/screens/src1_portada.dart';
import 'package:alnabekapp/screens/src2_login.dart';
import 'package:alnabekapp/screens/src3_home.dart';
import 'package:alnabekapp/screens/src4_entrada.dart';
import 'package:alnabekapp/screens/src5_shawarma.dart';

Map <String, Widget Function(BuildContext)> rutasApp = {
  '/': (context) => const PortadaScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/entrada': (context) => const EntradaScreen(),
  '/shawarma': (context) => const ShawarmaScreen(),
};