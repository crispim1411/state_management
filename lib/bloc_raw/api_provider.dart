import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class ApiProvider {
  getValue() async {
    var uri = Uri.http(Config.apiURL, Config.endpoint);
    var response = await http.get(uri);
    var value = jsonDecode(response.body)[0];
    return value;
  }
}