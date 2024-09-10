abstract class EditPassengerState {}

final class EditPassengerInitial extends EditPassengerState {}

class EditPassengerLoading extends EditPassengerState {}

class EditPassengerSuccess extends EditPassengerState {
  final String message;
  EditPassengerSuccess({required this.message});
}

//class TimeSuccess extends AddPassengerState {}

class EditPassengerGotFiltersSuccess extends EditPassengerState {}

class EditPassengerFailure extends EditPassengerState {
  final String message;
  EditPassengerFailure({required this.message});
}
