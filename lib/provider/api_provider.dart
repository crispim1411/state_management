import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class ApiProvider extends ChangeNotifier {
  String screenValue = 'loading...';

  void getValue() async {
    var uri = Uri.http(Config.apiURL, Config.endpoint);
    var response = await http.get(uri);
    var value = jsonDecode(response.body)[0];
    screenValue = value;
    notifyListeners();
  }
}