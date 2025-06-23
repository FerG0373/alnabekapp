import 'package:alnabekapp/components/appbar.dart';
import 'package:alnabekapp/components/button.dart';
import 'package:alnabekapp/components/imagecard.dart';
import 'package:alnabekapp/controllers/del_shawarma_controller.dart';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:alnabekapp/res/app_imagespath.dart';
import 'package:alnabekapp/screens/edit_shawarma.dart';
import 'package:alnabekapp/services/shawarma_service.dart';
import 'package:flutter/material.dart';

class ShawarmaScreen extends StatefulWidget {
  const ShawarmaScreen({super.key});

  @override
  State<ShawarmaScreen> createState() => _ShawarmaScreenState();
}

class _ShawarmaScreenState extends State<ShawarmaScreen> {
  late Future<List<Shawarma>> _listaShawarmasFuture;
  final DeleteShawarmaController _deleteControlador = DeleteShawarmaController();

  @override
  void initState() {
    super.initState();
    _listaShawarmasFuture = ShawarmaService().getShawarmas();
  }

  Future<void> _recargarListaShawarmas() async {
    setState(() {
      _listaShawarmasFuture = ShawarmaService().getShawarmas();
    });
  }

  // Método para mostrar mensajes.
  void _mostrarMensaje(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
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
          future: _listaShawarmasFuture,
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
                  _recargarListaShawarmas();
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
                              Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditShawarma(
                                        shawarmaOriginal: shawarma,
                                      ),
                                    ),
                                  ).then((_) {
                                    // Refresca la lista al regresar de la pantalla de edición.
                                    _recargarListaShawarmas();
                                  });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              final confirmar = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Confirmar eliminación'),
                                  content: Text('¿Estás seguro de que deseas eliminar este elemento?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(false),
                                      child: Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pop(true),
                                      child: Text('Eliminar', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmar == true) {
                                final eliminado = await _deleteControlador.eliminarShawarma(shawarma.id);
                                if (eliminado) {
                                  _mostrarMensaje('Shawarma eliminado con éxito');
                                  _recargarListaShawarmas();
                                } else {
                                  _mostrarMensaje('Error al eliminar el shawarma');
                                }
                              }
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
