import 'dart:convert';

import 'package:getout/models/bar_model.dart';
import 'package:http/http.dart' as http;

class BarService {
  // final baseUrl = "192.168.1.9/api";
  final baseUrl = "http://192.168.1.9:5000/api";

  Future<Bar> fetchBars() async {
    final fetchedBars = await http.get(Uri.parse("$baseUrl/bars"));
    if (fetchedBars.statusCode == 200) {
      final data = jsonDecode(fetchedBars.body);
      return Bar(
          name: data['name']); // Assuming API response has a "name" field
    } else {
      throw Exception("Failed to fetch bar");
    }
  }

  Future<Bar> barReset() async {
    final fetchedBars = await http.get(Uri.parse("$baseUrl/bars/1"));
    if (fetchedBars.statusCode == 200) {
      final data = jsonDecode(fetchedBars.body);
      return Bar(
          name: data['name']); // Assuming API response has a "name" field
    } else {
      throw Exception("Failed to fetch bar");
    }
  }
}
