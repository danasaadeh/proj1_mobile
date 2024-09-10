part of 'flight_reserv_details_cubit.dart';

@immutable
sealed class FlightReservDetailsState {}

final class FlightReservDetailsInitial extends FlightReservDetailsState {}

class FlightReservDetailsLoading extends FlightReservDetailsState {}

class FlightReservDetailsSuccess extends FlightReservDetailsState {
  final FlightReservation flightReserv;

  FlightReservDetailsSuccess({required this.flightReserv});
}

class FlightReservDetailsFailure extends FlightReservDetailsState {
  final String error;

  FlightReservDetailsFailure({required this.error});
}

class FlightReservDetailsEmpty extends FlightReservDetailsState {
  final String message;

  FlightReservDetailsEmpty({required this.message});
}
