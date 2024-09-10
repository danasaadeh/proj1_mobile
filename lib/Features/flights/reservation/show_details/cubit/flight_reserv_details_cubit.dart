import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

import 'package:tourism/model/flight_reserv_details.dart';

part 'flight_reserv_details_state.dart';

class FlightReservDetailsCubit extends Cubit<FlightReservDetailsState> {
  FlightReservDetailsCubit() : super(FlightReservDetailsInitial());
  FlightReservation? flight;
  Future<void> getFlightReservDetails(int id) async {
    emit(FlightReservDetailsLoading());

    try {
      final response = await Api().get(
          url: '${Api().base_url}/showReservFlightDetails/$id',
          token: prefs!.getString('token'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData.isNotEmpty) {
          flight = FlightReservation.fromJson(jsonData);
          emit(FlightReservDetailsSuccess(flightReserv: flight!));
        } else {
          emit(FlightReservDetailsEmpty(message: 'there is no Flight details'));
        }
      } else {
        emit(FlightReservDetailsFailure(
            error: 'Failed to fetch flight details'));
      }
    } catch (e) {
      emit(FlightReservDetailsFailure(error: 'An error occurred: $e'));
    }
  }
}
