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

  Future<void> _refreshShawarmas() async {
    setState(() {
      _shawarmasFuture = ShawarmaService().getShawarmas();
    });
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
        // Listado de Shawarmas.
        Expanded(
          child: FutureBuilder<List<Shawarma>>(
          future: _shawarmasFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if(!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No hay registros"));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  _refreshShawarmas();
                },
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, i) {
                    final shawarma = snapshot.data![i];
                    return ListTile(
                      title: Text(shawarma.nombre),
                      subtitle: Text('Precio: \$${shawarma.precio}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Esto asegura que la fila ocupe solo el espacio necesario.
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.pushNamed(context, 'editShawarma');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              
                            },
                          ),
                        ],
                      ),
                    );
                  }
                )
              );
            }
          }          
          ),
        )
        
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
