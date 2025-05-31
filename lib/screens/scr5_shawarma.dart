import 'package:alnabekapp/components/appbars.dart';
import 'package:alnabekapp/components/imagecards.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:flutter/material.dart';

class ShawarmaScreen extends StatefulWidget {
  const ShawarmaScreen({super.key});

  @override
  State<ShawarmaScreen> createState() => _ShawarmaScreenState();
}

class _ShawarmaScreenState extends State<ShawarmaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, 'Shawarma', false),

      body: Column(
        children: [

          AppImageCards.insertarMenuCard(context, AppImages.shawarmaMenu, ''),
        ],
      )
    );
  }
}