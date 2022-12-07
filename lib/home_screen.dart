import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createRow(context, 'setState'),
          _createRow(context, 'provider'),
        ],
      )
    );
  }

  _createRow(context, route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/$route"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$route Approach", style: const TextStyle(fontSize: 18)), 
          const Icon(Icons.arrow_forward)
        ],
      )
    );
  }
}