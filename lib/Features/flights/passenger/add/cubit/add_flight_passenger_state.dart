import 'package:tourism/model/add_pass_model.dart';

abstract class AddFlightPassengerState {}

final class AddFlightPassengerInitial extends AddFlightPassengerState {}

class AddFlightPassengerLoading extends AddFlightPassengerState {}

class AddFlightPassengerSuccess extends AddFlightPassengerState {
  final String message;
  final AddPassenger add_pass;
  AddFlightPassengerSuccess({required this.message, required this.add_pass});
}

//class TimeSuccess extends AddFlightPassengerState {}

class AddFlightPassengerGotFiltersSuccess extends AddFlightPassengerState {}

class AddFlightPassengerFailure extends AddFlightPassengerState {
  final String message;
  AddFlightPassengerFailure({required this.message});
}
