import 'package:tourism/model/add_pass_model.dart';

abstract class ShowFlightPassengerState {}

final class ShowFlightPassengerInitial extends ShowFlightPassengerState {}

class ShowFlightPassengerLoading extends ShowFlightPassengerState {}

class ShowFlightPassengerSuccess extends ShowFlightPassengerState {
  final String message;
  final ShowPassenger pass;
  ShowFlightPassengerSuccess({required this.message, required this.pass});
}

class ShowFlightPassengerGotFiltersSuccess extends ShowFlightPassengerState {}

class ShowFlightPassengerEmpty extends ShowFlightPassengerState {
  final String message;
  ShowFlightPassengerEmpty({required this.message});
}

class ShowFlightPassengerFailure extends ShowFlightPassengerState {
  final String message;
  ShowFlightPassengerFailure({required this.message});
}
