import 'package:flutter/material.dart';

import 'api_connector.dart';

class SetStateScreen extends StatelessWidget {
  const SetStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('setState Approach')),
      body: _displayValue()
    );
  }

  _displayValue() {
    return Center(
      child: FutureBuilder(
        future: ApiConnector.getValue(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data as String);
          } else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }
}