import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:siap/core/constants/alamat.dart';
import 'package:siap/core/errors/exception.dart';

class ApiService {
  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(Apis.baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = jsonDecode(response.body);

    if (response.statusCode == 401) {
      throw UnauthorizedException();
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    throw Exception(data['message'] ?? 'Error');
  }
}
