import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/category_model.dart';

class MealsService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';

  // 1. Ambil data dari API
  Future<List<categories>> fetchcategoriesList() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> data = jsonResponse['category'];
      return data.map((json) =>categories.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load category data');
    }
  }

  
}