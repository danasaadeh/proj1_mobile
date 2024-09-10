abstract class DeletePassengerState {}

final class DeletePassengerInitial extends DeletePassengerState {}

class DeletePassengerLoading extends DeletePassengerState {}

class DeletePassengerSuccess extends DeletePassengerState {
  final String message;
  DeletePassengerSuccess({required this.message});
}

//class TimeSuccess extends AddPassengerState {}

class DeletePassengerGotFiltersSuccess extends DeletePassengerState {}

class DeletePassengerFailure extends DeletePassengerState {
  final String message;
  DeletePassengerFailure({required this.message});
}
