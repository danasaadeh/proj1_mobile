part of 'trip_reserv_details_cubit.dart';

@immutable
sealed class TripReservDetailsState {}

final class TripReservDetailsInitial extends TripReservDetailsState {}

class TripReservDetailsLoading extends TripReservDetailsState {}

class TripReservDetailsSuccess extends TripReservDetailsState {
  final TripReservation tripReserv;

  TripReservDetailsSuccess({required this.tripReserv});
}

class TripReservDetailsFailure extends TripReservDetailsState {
  final String error;

  TripReservDetailsFailure({required this.error});
}

class TripReservDetailsEmpty extends TripReservDetailsState {
  final String message;

  TripReservDetailsEmpty({required this.message});
}
