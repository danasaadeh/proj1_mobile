abstract class DeleteFlightPassengerState {}

final class DeleteFlightPassengerInitial extends DeleteFlightPassengerState {}

class DeleteFlightPassengerLoading extends DeleteFlightPassengerState {}

class DeleteFlightPassengerSuccess extends DeleteFlightPassengerState {
  final String message;
  DeleteFlightPassengerSuccess({required this.message});
}

//class TimeSuccess extends AddPassengerState {}

class DeleteFlightPassengerGotFiltersSuccess
    extends DeleteFlightPassengerState {}

class DeleteFlightPassengerFailure extends DeleteFlightPassengerState {
  final String message;
  DeleteFlightPassengerFailure({required this.message});
}
