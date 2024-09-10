abstract class ReservFlightState {}

class ReservFlightInitial extends ReservFlightState {}

class ReservFlightLoading extends ReservFlightState {}

class ReservFlightSuccess extends ReservFlightState {
  final String message;

  ReservFlightSuccess({required this.message});
}

class ReservFlightGotFiltersSuccess extends ReservFlightState {}

class ReservFlightFailure extends ReservFlightState {
  final String message;
  ReservFlightFailure({required this.message});
}
