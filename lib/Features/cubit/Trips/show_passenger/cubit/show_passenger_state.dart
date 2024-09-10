import 'package:tourism/model/add_pass_model.dart';

abstract class ShowPassengerState {}

final class ShowPassengerInitial extends ShowPassengerState {}

class ShowPassengerLoading extends ShowPassengerState {}

class ShowPassengerSuccess extends ShowPassengerState {
  final String message;
  final ShowPassenger pass;
  ShowPassengerSuccess({required this.message, required this.pass});
}

class ShowPassengerGotFiltersSuccess extends ShowPassengerState {}

class ShowPassengerEmpty extends ShowPassengerState {
  final String message;
  ShowPassengerEmpty({required this.message});
}

class ShowPassengerFailure extends ShowPassengerState {
  final String message;
  ShowPassengerFailure({required this.message});
}
