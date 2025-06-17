class Shawarma {
  final int _id;
  final String _nombre;
  final String? _descripcion;
  final double _precio;
  final String _tipo;

  // Constructor.
  Shawarma({
    required int id,
    required String nombre,
    String? descripcion,
    required double precio,
    required String tipo,
  }) : _id = id,
       _nombre = nombre,
       _descripcion = descripcion,
       _precio = precio,
       _tipo = tipo;

  // Getters.
  int get id => _id;
  String get nombre => _nombre;
  String? get descripcion => _descripcion;
  double get precio => _precio;
  String get imagen => _tipo;

  // Convierte JSON a Map.
  factory Shawarma.fromJson(Map<String, dynamic> json) {
    return Shawarma(
      id: json['id_comida'] ?? 0,
      nombre: json['nombre_comida'],
      descripcion: json['descripcion_comida'] ?? '',
      precio: (json['precio_comida'] as num).toDouble(),
      tipo: json['tipo_comida'],
    );
  }
}
