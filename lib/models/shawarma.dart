class Shawarma {
  final String _nombre;
  final String _descripcion;
  final double _precio;
  final String _imagen;

  // Constructor.
  Shawarma(this._nombre, this._descripcion, this._precio, this._imagen);

  // Getters.
  String get nombre => _nombre;
  String get descripcion => _descripcion;
  double get precio => _precio;
  String get imagen => _imagen;
  
}