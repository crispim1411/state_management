import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ApiConnector {
  static getValue() async {
    var uri = Uri.http(Config.baseURL, '/api/v1.0/uuid');
    var response = await http.get(uri);
    return jsonDecode(response.body)[0];
  }
}