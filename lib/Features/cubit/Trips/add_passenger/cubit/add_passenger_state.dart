import 'package:tourism/model/add_pass_model.dart';

abstract class AddPassengerState {}

final class AddPassengerInitial extends AddPassengerState {}

class AddPassengerLoading extends AddPassengerState {}

class AddPassengerSuccess extends AddPassengerState {
  final String message;
  final AddPassenger add_pass;
  AddPassengerSuccess({required this.message, required this.add_pass});
}

//class TimeSuccess extends AddPassengerState {}

class AddPassengerGotFiltersSuccess extends AddPassengerState {}

class AddPassengerFailure extends AddPassengerState {
  final String message;
  AddPassengerFailure({required this.message});
}
