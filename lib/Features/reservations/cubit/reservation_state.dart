import 'package:tourism/model/reservations.dart';

abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationSuccess extends ReservationState {
  final List<FlightAllReservation> flightReservations;
  final List<HotelAllReservation> hotelReservations;
  final List<TripAllReservation> tripReservations;

  ReservationSuccess({
    required this.flightReservations,
    required this.hotelReservations,
    required this.tripReservations,
  });
}

class ReservationLoading extends ReservationState {}

class ReservationEmpty extends ReservationState {
  final String message;

  ReservationEmpty({required this.message});
}

class ReservationFailure extends ReservationState {
  final String message;

  ReservationFailure({required this.message});
}
