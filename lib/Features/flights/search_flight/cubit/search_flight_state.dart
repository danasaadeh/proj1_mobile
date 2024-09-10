import 'package:tourism/model/search_flight_model.dart';

abstract class SearchFlightState {}

class SearchFlightInitial extends SearchFlightState {}

class SearchFlightLoading extends SearchFlightState {}

class SearchFlightSuccess extends SearchFlightState {
  final String message;
  final List<AvailableFlight> flights;

  SearchFlightSuccess({required this.message, required this.flights});
}

class SearchFlightGotFiltersSuccess extends SearchFlightState {}

class SearchFlightFailure extends SearchFlightState {
  final String message;
  SearchFlightFailure({required this.message});
}

class SearchFlightEmpty extends SearchFlightState {
  final String message;
  SearchFlightEmpty({required this.message});
}

class SearchFlightRoundSuccess extends SearchFlightState {
  final String message;
  final List<AvailableFlight>? departFlights;
  final List<AvailableFlight>? returnFlights;
  SearchFlightRoundSuccess({
    required this.message,
    this.departFlights,
    this.returnFlights,
  });
}

class SearchFlightRoundEmpty extends SearchFlightState {
  final String message;
  //final bool isEmptyDepart;
  // final bool isEmptyReturn;
  SearchFlightRoundEmpty({
    required this.message,
    //required this.isEmptyDepart,
    //  required this.isEmptyReturn,
  });
}
