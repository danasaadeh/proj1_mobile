import 'package:tourism/model/home.dart';
import 'package:tourism/model/user.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFlightSuccess extends HomeState {
  final List<FlightHome> flights;

  HomeFlightSuccess({
    required this.flights,
  });
}

class HomeHotelSuccess extends HomeState {
  final List<HotelHome> hotels;

  HomeHotelSuccess({
    required this.hotels,
  });
}

class HomeAttracSuccess extends HomeState {
  final List<AttracHome> attrac;

  HomeAttracSuccess({
    required this.attrac,
  });
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}

class HomeEmpty extends HomeState {
  final String message;

  HomeEmpty({
    required this.message,
  });
}

class HomeSuccess extends HomeState {
  final List<AttracHome> attrac;
  final List<FlightHome> flights;
  final List<HotelHome> hotels;
  HomeSuccess(
      {required this.attrac, required this.hotels, required this.flights});
}
