import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('setState Approach'), 
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/setState'), 
                icon: const Icon(Icons.arrow_forward)
              )
            ],
          )
        ],
      )
    );
  }
}