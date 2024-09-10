part of 'hotel_reserv_details_cubit.dart';

@immutable
sealed class HotelReservDetailsState {}

final class HotelReservDetailsInitial extends HotelReservDetailsState {}

class HotelReservDetailsLoading extends HotelReservDetailsState {}

class HotelReservDetailsSuccess extends HotelReservDetailsState {
  final String message;
  final HotelReservation reservation;

  HotelReservDetailsSuccess({required this.message, required this.reservation});
}

class HotelReservDetailsFailure extends HotelReservDetailsState {
  final String message;

  HotelReservDetailsFailure({required this.message});
}

class HotelReservDetailsEmpty extends HotelReservDetailsState {
  final String message;

  HotelReservDetailsEmpty({required this.message});
}
