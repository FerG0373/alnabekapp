import 'package:alnabekapp/services/shawarma_service.dart';

class DeleteShawarmaController {
  final ShawarmaService _shawarmaService = ShawarmaService();

  Future<bool> eliminarShawarma(int id) async {
    return await _shawarmaService.eliminarShawarma(id);
  }
}
