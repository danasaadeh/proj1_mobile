import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_state.dart';
import 'package:tourism/Features/flights/reserv_flight/cubit/reserv_flight_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class ReservFlightCubit extends Cubit<ReservFlightState> {
  ReservFlightCubit() : super(ReservFlightInitial());

  Future<void> reservFlight(
      {required String walletPassword,
      required List<Map<String, String>> passengers,
      //  required String passenger,
      required String phoneNumber,
      required String email,
      required String contactName,
      required String checkedBag_num,
      required int id}) async {
    try {
      emit(ReservFlightLoading());
      String base_url = Api().base_url;
      final requestBody = {
        "wallet_password": walletPassword,
        "phone_number": phoneNumber,
        'passenger': passengers,
        // "passenger": [
        //   {"given_name": passenger},
        // ],
        "email": email,
        "caontact_name": contactName,
        "checkedBag_num": checkedBag_num,
      };
      final response = await Api().post(
        url: '$base_url/reservFlight/$id',
        content: 'application/json',
        body: jsonEncode(requestBody),
        token: prefs!.getString("token"),
      );

      if (response.statusCode == 200) {
        emit(ReservFlightSuccess(message: 'success'));
      } else {
        emit(ReservFlightFailure(message: "Error reserving trip"));
      }
    } catch (e) {
      emit(ReservFlightFailure(message: 'An error occurred: $e'));
    }
  }
}
