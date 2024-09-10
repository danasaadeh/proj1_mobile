abstract class UpdateFlightReservState {}

class UpdateFlightReservInitial extends UpdateFlightReservState {}

class UpdateFlightReservLoading extends UpdateFlightReservState {}

class UpdateFlightReservSuccess extends UpdateFlightReservState {
  final String message;

  UpdateFlightReservSuccess({required this.message});
}

class UpdateFlightReservGotFiltersSuccess extends UpdateFlightReservState {}

class UpdateFlightReservFailure extends UpdateFlightReservState {
  final String message;
  UpdateFlightReservFailure({required this.message});
}
