import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/show_passenger/cubit/show_passenger_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/add_pass_model.dart';

class ShowPassengerCubit extends Cubit<ShowPassengerState> {
  ShowPassengerCubit() : super(ShowPassengerInitial());
  Future<void> getTripPassenger(int id) async {
    emit(ShowPassengerLoading());

    try {
      final data = await Api().get(
          url: '${Api().base_url}/showTripPassenger/$id',
          token: prefs!.getString('token'));

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final pass = ShowPassenger.fromJson(responseData);
        emit(ShowPassengerSuccess(message: 'Success', pass: pass));
      } else {
        emit(ShowPassengerFailure(message: 'Failed to fetch trip passengers'));
      }
    } catch (e) {
      emit(ShowPassengerFailure(message: 'An error occurred: $e'));
    }
  }
}
