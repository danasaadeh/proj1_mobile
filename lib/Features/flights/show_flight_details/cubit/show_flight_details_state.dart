import 'package:tourism/model/flight_details.dart';

abstract class ShowFlightDetailsState {}

final class ShowFlightDetailsInitial extends ShowFlightDetailsState {}

final class ShowFlightDetailsSuccess extends ShowFlightDetailsState {
  final FlightDetails flightDetails;

  ShowFlightDetailsSuccess({required this.flightDetails});
}

final class ShowFlightDetailsLoading extends ShowFlightDetailsState {}

final class ShowFlightDetailsEmpty extends ShowFlightDetailsState {}

final class ShowFlightDetailsFailure extends ShowFlightDetailsState {
  final String message;
  ShowFlightDetailsFailure({required this.message});
}
