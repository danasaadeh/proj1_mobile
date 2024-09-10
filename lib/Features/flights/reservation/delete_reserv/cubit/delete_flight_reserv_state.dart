abstract class DeleteFlightReservState {}

class DeleteFlightReservInitial extends DeleteFlightReservState {}

class DeleteFlightReservLoading extends DeleteFlightReservState {}

class DeleteFlightReservSuccess extends DeleteFlightReservState {
  final String message;

  DeleteFlightReservSuccess(this.message);
}

class DeleteFlightReservError extends DeleteFlightReservState {
  final String message;

  DeleteFlightReservError(this.message);
}
