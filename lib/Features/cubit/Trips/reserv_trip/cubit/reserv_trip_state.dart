abstract class ReservTripState {}

final class ReservTripInitial extends ReservTripState {}

class ReservTripLoading extends ReservTripState {}

class ReservTripSuccess extends ReservTripState {
  final String message;
  ReservTripSuccess({required this.message});
}

//class TimeSuccess extends ReservTripState {}

class ReservTripGotFiltersSuccess extends ReservTripState {}

class ReservTripFailure extends ReservTripState {
  final String message;
  ReservTripFailure({required this.message});
}
