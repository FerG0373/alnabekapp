import 'dart:convert';
import 'package:alnabekapp/models/shawarma.dart';
import 'package:http/http.dart' as http;

class ShawarmaService {
  final String baseUrl = "https://api.awspaints.com.ar/index.php";

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
} 