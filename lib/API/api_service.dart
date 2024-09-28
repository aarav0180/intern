// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Constant/constant.dart';
import '../models/user_model.dart';


class ApiService {
  final String baseUrl = "http://3.6.39.220/internal/user/$userId";

  Future<UserModel?> getUserData() async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'x-source': xSource,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return UserModel.fromJson(responseData['data']);
      } else if (response.statusCode == 401) {
        print('Unauthorized: ${response.body}');
      } else {
        print('Unexpected response: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }
}

