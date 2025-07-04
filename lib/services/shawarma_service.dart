import 'dart:convert';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:http/http.dart' as http;

class ShawarmaService {
  final String baseUrl = "https://api.awspaints.com.ar/index.php";
  // Método Get
  Future<List<Shawarma>> getShawarmas() async {
    final response = await http.get(Uri.parse('$baseUrl/shawarmaComidas'));

    if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if(jsonResponse is List) {
        List<Shawarma> shawarmas = jsonResponse.map((data) => Shawarma.fromJson(Map<String, dynamic>.from(data))).toList();

        shawarmas.sort((a, b) => b.id.compareTo(a.id));
        return shawarmas;
      } else {
        throw Exception('Error: Formato de datos inesperado');
      }
    } else {
      throw Exception('Error al cargar los shawarmas: ${response.statusCode}');
    }
  }

  // Método Post  
  Future<bool> insertarShawarma(Shawarma nuevoShawarma) async {
    final url = Uri.parse('$baseUrl/shawarmaComidas');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(nuevoShawarma.toJson());

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {      
      return false;
    }
  }

  // Método Put.
  Future<bool> actualizarShawarma(int id, Map<String, dynamic> shawarmaCompleto) async {
    final url = Uri.parse('$baseUrl/shawarmaComidas/$id');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(shawarmaCompleto);

    try {
      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Método Delete.
  Future<bool> eliminarShawarma(int id) async {
    final url = Uri.parse('$baseUrl/shawarmaComidas/$id');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
} 