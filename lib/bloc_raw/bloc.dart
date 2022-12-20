import 'dart:async';
import 'api_provider.dart';
import 'events.dart';
import 'states.dart';

class Bloc {
  final _provider = ApiProvider();

  final  _inputController = StreamController<BlocEvent>();
  final  _outputController = StreamController<BlocState>();

  Sink<BlocEvent> get input => _inputController.sink;
  Stream<BlocState> get stream => _outputController.stream;

  Bloc() {
    _inputController.stream.listen(_mapBlocEventToState);
  }

  _mapBlocEventToState(BlocEvent event) {
    if (event is LoadingEvent) {
      _outputController.add(LoadingState());
    } else if (event is GetValueEvent) {
      _provider.getValue().then((response) {
        if (response == null) return;
        _outputController.add(SuccessState(value: response));
      });
    } else {
      _outputController.add(ErrorState());
    } 
  }
} 