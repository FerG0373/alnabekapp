import 'package:flutter/material.dart';
import 'package:alnabekapp/screens/scr1_portada.dart';
import 'package:alnabekapp/screens/scr2_login.dart';
import 'package:alnabekapp/screens/scr3_home.dart';
import 'package:alnabekapp/screens/scr4_entrada.dart';
import 'package:alnabekapp/screens/scr5_shawarma.dart';

Map <String, Widget Function(BuildContext)> rutasApp = {
  '/': (context) => const PortadaScreen(),
  '/login': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/entrada': (context) => const EntradaScreen(),
  '/shawarma': (context) => const ShawarmaScreen(),
};