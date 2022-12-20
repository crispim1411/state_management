import 'dart:async';
import 'package:api_req_flutter/bloc_raw/events.dart';
import 'package:api_req_flutter/bloc_raw/states.dart';
import 'package:flutter/material.dart';
import '../config.dart';
import 'bloc.dart';

class BlocRawScreen extends StatefulWidget {
  const BlocRawScreen({super.key});

  @override
  State<StatefulWidget> createState() => _BlocRawScreenState();
}

class _BlocRawScreenState extends State<BlocRawScreen> {
  late Timer _timer;
  late final Bloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Bloc();
    bloc.input.add(LoadingEvent());
    _timer = Timer.periodic(
      Config.intervalRefresh, 
      (_) => bloc.input.add(GetValueEvent()));
  }

  @override
  void dispose() {
    _timer.cancel();
    bloc.input.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('setState Approach')),
      body: Center(
        child: StreamBuilder<BlocState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final value = snapshot.data?.screenValue ?? 'none';
            return Text(value);
          },
        )
      )
    );
  }
}
