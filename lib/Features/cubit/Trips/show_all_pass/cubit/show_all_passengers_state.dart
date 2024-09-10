import 'package:tourism/model/add_pass_model.dart';

abstract class ShowAllPassengersState {}

final class ShowAllPassengersInitial extends ShowAllPassengersState {}

class ShowAllPassengersLoading extends ShowAllPassengersState {}

class ShowAllPassengersSuccess extends ShowAllPassengersState {
  final String message;
  final List<AddPassenger> pass;
  ShowAllPassengersSuccess({required this.message, required this.pass});
}

class ShowAllPassengersDeleteSuccess extends ShowAllPassengersState {
  final String message;

  ShowAllPassengersDeleteSuccess({required this.message});
}

class ShowAllPassengersGotFiltersSuccess extends ShowAllPassengersState {}

class ShowAllPassengersEmpty extends ShowAllPassengersState {
  final String message;
  ShowAllPassengersEmpty({required this.message});
}

class ShowAllPassengersFailure extends ShowAllPassengersState {
  final String message;
  ShowAllPassengersFailure({required this.message});
}
