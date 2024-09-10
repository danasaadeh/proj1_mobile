abstract class UpdateTripReservState {}

final class UpdateTripReservInitial extends UpdateTripReservState {}

class UpdateTripReservLoading extends UpdateTripReservState {}

class UpdateTripReservSuccess extends UpdateTripReservState {
  final String message;
  UpdateTripReservSuccess({required this.message});
}

//class TimeSuccess extends UpdateTripReservState {}

class UpdateTripReservGotFiltersSuccess extends UpdateTripReservState {}

class UpdateTripReservFailure extends UpdateTripReservState {
  final String message;
  UpdateTripReservFailure({required this.message});
}
