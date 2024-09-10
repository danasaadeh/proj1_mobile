import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/show_passenger/cubit/show_passenger_state.dart';
import 'package:tourism/Features/flights/passenger/show/cubit/show_flight_passenger_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/add_pass_model.dart';

class ShowFlightPassengerCubit extends Cubit<ShowFlightPassengerState> {
  ShowFlightPassengerCubit() : super(ShowFlightPassengerInitial());
  Future<void> getFlightPassenger(int id) async {
    emit(ShowFlightPassengerLoading());

    try {
      final data = await Api().get(
          url: '${Api().base_url}/showFlightPassenger/$id',
          token: prefs!.getString('token'));

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final pass = ShowPassenger.fromJson(responseData);
        emit(ShowFlightPassengerSuccess(message: 'Success', pass: pass));
      } else {
        emit(ShowFlightPassengerFailure(
            message: 'Failed to fetch trip passengers'));
      }
    } catch (e) {
      emit(ShowFlightPassengerFailure(message: 'An error occurred: $e'));
    }
  }
}
