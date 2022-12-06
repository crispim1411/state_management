import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class SetStateScreen extends StatefulWidget {
  const SetStateScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  String screenValue = 'loading...';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (_) => getValue());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('setState Approach')),
      body: Center(child: Text(screenValue))
    );
  }

  void getValue() async {
    var uri = Uri.http(Config.apiURL, Config.endpoint);
    var response = await http.get(uri);
    var value = jsonDecode(response.body)[0];
    
    if (mounted) {
      setState(() {
        screenValue = value;
      });
    }
  }
}
