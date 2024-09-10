import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/reserv/update_reserv/cubit/update_trip_reserv_state.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class UpdateTripReservCubit extends Cubit<UpdateTripReservState> {
  UpdateTripReservCubit() : super(UpdateTripReservInitial());

  Future<void> updateReserveTrip(
      {required String walletPassword,
      // required String passenger,
      required List<Map<String, String>> passengers,
      required String phoneNumber,
      required String email,
      required String contactName,
      required int id}) async {
    try {
      emit(UpdateTripReservLoading());
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
        url: '$base_url/updateReservTrip/$id',
        content: 'application/json',
        token: prefs!.getString("token"),
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        emit(UpdateTripReservSuccess(message: 'success'));
      } else {
        emit(UpdateTripReservFailure(message: "Error reserving trip"));
      }
    } catch (e) {
      emit(UpdateTripReservFailure(message: 'An error occurred: $e'));
    }
  }
}
