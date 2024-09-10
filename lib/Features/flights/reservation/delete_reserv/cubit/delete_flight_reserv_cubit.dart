import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/flights/reservation/delete_reserv/cubit/delete_flight_reserv_state.dart';
import 'package:tourism/helper/api.dart';

class DeleteFlightReservCubit extends Cubit<DeleteFlightReservState> {
  DeleteFlightReservCubit() : super(DeleteFlightReservInitial());
  Future<void> deleteDeleteFlightReserv(int id) async {
    emit(DeleteFlightReservLoading());
    try {
      final response =
          await Api().get(url: "${Api().base_url}/deleteReservFlight/$id");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        String message =
            responseData['message'] ?? "The reserve can't be deleted";
        emit(DeleteFlightReservSuccess(message));
      } else {
        emit(DeleteFlightReservError('Failed to delete the reservation'));
      }
    } catch (e) {
      emit(DeleteFlightReservError(e.toString()));
    }
  }
}
