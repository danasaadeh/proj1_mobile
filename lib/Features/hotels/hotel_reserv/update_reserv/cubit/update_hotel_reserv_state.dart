abstract class UpdateHotelReservState {}

class UpdateHotelReservInitial extends UpdateHotelReservState {}

class UpdateHotelReservLoading extends UpdateHotelReservState {}

class UpdateHotelReservSuccess extends UpdateHotelReservState {
  final String message;

  UpdateHotelReservSuccess({required this.message});
}

class UpdateHotelReservGotFiltersSuccess extends UpdateHotelReservState {}

class UpdateHotelReservFailure extends UpdateHotelReservState {
  final String message;
  UpdateHotelReservFailure({required this.message});
}
