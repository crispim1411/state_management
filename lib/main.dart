import 'package:api_req_flutter/bloc_raw/bloc_screen.dart';
import 'package:api_req_flutter/provider/api_provider.dart';
import 'package:api_req_flutter/setState/setstate_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'provider/provider_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ApiProvider(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/setState': (context) => const SetStateScreen(),
        '/provider': (context) => const ProviderScreen(),
        '/bloc_raw': (context) => const BlocRawScreen(),
      }
    );
  }
}