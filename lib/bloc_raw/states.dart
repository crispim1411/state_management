abstract class BlocState {
  String screenValue;
  BlocState({
    required this.screenValue
  });
}

class SuccessState extends BlocState {
  SuccessState({required value}) : super(screenValue: value);
}

class LoadingState extends BlocState {
  LoadingState() : super(screenValue: 'loading...');
}

class ErrorState extends BlocState {
  ErrorState() : super(screenValue: 'Error fetching data');
}