import 'package:tourism/model/add_pass_model.dart';

abstract class ShowAllFlightPassengersState {}

final class ShowAllFlightPassengersInitial
    extends ShowAllFlightPassengersState {}

class ShowAllFlightPassengersLoading extends ShowAllFlightPassengersState {}

class ShowAllFlightPassengersSuccess extends ShowAllFlightPassengersState {
  final String message;
  final List<AddPassenger> pass;
  ShowAllFlightPassengersSuccess({required this.message, required this.pass});
}

class ShowAllFlightPassengersGotFiltersSuccess
    extends ShowAllFlightPassengersState {}

class ShowAllFlightPassengersEmpty extends ShowAllFlightPassengersState {
  final String message;
  ShowAllFlightPassengersEmpty({required this.message});
}

class ShowAllFlightPassengersFailure extends ShowAllFlightPassengersState {
  final String message;
  ShowAllFlightPassengersFailure({required this.message});
}
