abstract class DeleteHotelReservState {}

class DeleteHotelReservInitial extends DeleteHotelReservState {}

class DeleteHotelReservLoading extends DeleteHotelReservState {}

class DeleteHotelReservSuccess extends DeleteHotelReservState {
  final String message;

  DeleteHotelReservSuccess(this.message);
}

class DeleteHotelReservError extends DeleteHotelReservState {
  final String message;

  DeleteHotelReservError(this.message);
}
