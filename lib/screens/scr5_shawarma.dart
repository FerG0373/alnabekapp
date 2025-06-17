import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/imagecard.dart';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/services/shawarma_service.dart';
import 'package:flutter/material.dart';

class ShawarmaScreen extends StatefulWidget {
  const ShawarmaScreen({super.key});

  @override
  State<ShawarmaScreen> createState() => _ShawarmaScreenState();
}

class _ShawarmaScreenState extends State<ShawarmaScreen> {
  late Future<List<Shawarma>> _shawarmasFuture;

  @override
  void initState() {
    super.initState();
    _shawarmasFuture = ShawarmaService().getShawarmas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbars.insertarAppBar(context, 'Shawarma', false),

      body: Column(
        children: [
          // Imagen portada.
          AppImageCards.insertarMenuPortada(
            context,
            AppImages.shawarmaMenu,
            '',
          ),
        
        
        ],
      ),
      // Botón Agregar.
      floatingActionButton: AppButton.insertarBotonAgregar(
        context,
        '/addShawarma',
      ),
    );
  }
}
