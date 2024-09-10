abstract class UpdateFlightPassengerState {}

final class UpdateFlightPassengerInitial extends UpdateFlightPassengerState {}

class UpdateFlightPassengerLoading extends UpdateFlightPassengerState {}

class UpdateFlightPassengerSuccess extends UpdateFlightPassengerState {
  final String message;
  UpdateFlightPassengerSuccess({required this.message});
}

//class TimeSuccess extends AddPassengerState {}

class UpdateFlightPassengerGotFiltersSuccess
    extends UpdateFlightPassengerState {}

class UpdateFlightPassengerFailure extends UpdateFlightPassengerState {
  final String message;
  UpdateFlightPassengerFailure({required this.message});
}
