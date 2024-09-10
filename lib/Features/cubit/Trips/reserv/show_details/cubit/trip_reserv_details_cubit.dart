import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

import 'package:tourism/model/trip_reserv_details.dart';

part 'trip_reserv_details_state.dart';

class TripReservDetailsCubit extends Cubit<TripReservDetailsState> {
  TripReservDetailsCubit() : super(TripReservDetailsInitial());
  TripReservation? trip;
  Future<void> getTripReservDetails(int id) async {
    emit(TripReservDetailsLoading());

    try {
      final response = await Api().get(
          url: '${Api().base_url}/showReservTripDetails/$id',
          token: prefs!.getString('token'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData.isNotEmpty) {
          trip = TripReservation.fromJson(jsonData);
          emit(TripReservDetailsSuccess(
            tripReserv: trip!,
          ));
        } else {
          emit(TripReservDetailsEmpty(message: 'there is no trip details'));
        }
      } else {
        emit(TripReservDetailsFailure(error: 'Failed to fetch trip details'));
      }
    } catch (e) {
      emit(TripReservDetailsFailure(error: 'An error occurred: $e'));
    }
  }
}
