import 'package:tourism/model/hotel_details.dart';
import 'package:tourism/pages/hotel_details.dart';

abstract class ShowHotelDetailsState {}

final class ShowHotelDetailsInitial extends ShowHotelDetailsState {}

final class ShowHotelDetailsSuccess extends ShowHotelDetailsState {
  final HotelDetails hotelDetails;

  ShowHotelDetailsSuccess({required this.hotelDetails});
}

final class ShowHotelDetailsLoading extends ShowHotelDetailsState {}

final class ShowHotelDetailsEmpty extends ShowHotelDetailsState {}

final class ShowHotelDetailsFailure extends ShowHotelDetailsState {
  final String message;
  ShowHotelDetailsFailure({required this.message});
}
