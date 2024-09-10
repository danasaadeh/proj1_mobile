import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class ReservTripCubit extends Cubit<ReservTripState> {
  ReservTripCubit() : super(ReservTripInitial());

  Future<void> reserveTrip(
      {required String walletPassword,
      // required String passenger,
      required List<Map<String, String>> passengers,
      required String phoneNumber,
      required String email,
      required String contactName,
      required int id}) async {
    try {
      emit(ReservTripLoading());
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
      };
      final response = await Api().post(
        url: '$base_url/reservTrip/$id',
        content: 'application/json',
        token: prefs!.getString("token"),
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        emit(ReservTripSuccess(message: 'success'));
      } else {
        emit(ReservTripFailure(message: "Error reserving trip"));
      }
    } catch (e) {
      emit(ReservTripFailure(message: 'An error occurred: $e'));
    }
  }
}
