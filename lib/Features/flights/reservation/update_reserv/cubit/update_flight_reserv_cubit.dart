import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tourism/Features/flights/reservation/update_reserv/cubit/update_flight_reserv_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class UpdateFlightReservCubit extends Cubit<UpdateFlightReservState> {
  UpdateFlightReservCubit() : super(UpdateFlightReservInitial());

  Future<void> updateUpdateFlightReserv(
      {required String walletPassword,
      required List<Map<String, String>> passengers,
      //  required String passenger,
      required String phoneNumber,
      required String email,
      required String contactName,
      required String checkedBag_num,
      required int id}) async {
    try {
      emit(UpdateFlightReservLoading());
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
        url: '$base_url/updateReservFlight/$id',
        content: 'application/json',
        body: jsonEncode(requestBody),
        token: prefs!.getString("token"),
      );

      if (response.statusCode == 200) {
        emit(UpdateFlightReservSuccess(message: 'success'));
      } else {
        emit(UpdateFlightReservFailure(message: "Error reserving trip"));
      }
    } catch (e) {
      emit(UpdateFlightReservFailure(message: 'An error occurred: $e'));
    }
  }
}
