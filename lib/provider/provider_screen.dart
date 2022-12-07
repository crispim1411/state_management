import 'dart:async';
import 'package:api_req_flutter/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Config.intervalRefresh, 
      (_) => context.read<ApiProvider>().getValue()
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Approach')),
      body: Center(
        child: Text(context.watch<ApiProvider>().screenValue)
      )
    );
  }
}
