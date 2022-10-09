part of 'radio_cubit.dart';

@immutable
abstract class RadioState {}

class RadioInitial extends RadioState {}

class StatusChanged extends RadioState {}

class RadioSuccess extends RadioState {}

class RadioLoaded extends RadioState {
  RadioLoaded({required Future<RadioModel> radioData}) {
    radioData = fetchData();
  }
}

class RadioError extends RadioState {
  RadioError(error) {
    print(error.toString());
  }
}
