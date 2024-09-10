abstract class DeleteTripReservState {}

class DeleteTripReservInitial extends DeleteTripReservState {}

class DeleteTripReservLoading extends DeleteTripReservState {}

class DeleteTripReservSuccess extends DeleteTripReservState {
  final String message;

  DeleteTripReservSuccess(this.message);
}

class DeleteTripReservError extends DeleteTripReservState {
  final String message;

  DeleteTripReservError(this.message);
}
