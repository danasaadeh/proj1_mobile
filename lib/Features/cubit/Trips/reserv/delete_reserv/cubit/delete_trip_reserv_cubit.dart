import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/reserv/delete_reserv/cubit/delete_trip_reserv_state.dart';
import 'package:tourism/helper/api.dart';

class DeleteTripReservCubit extends Cubit<DeleteTripReservState> {
  DeleteTripReservCubit() : super(DeleteTripReservInitial());
  Future<void> deleteDeleteTripReserv(int id) async {
    emit(DeleteTripReservLoading());
    try {
      final response =
          await Api().get(url: "${Api().base_url}/deleteReservTrip/$id");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        String message =
            responseData['message'] ?? "The reserve can't be deleted";
        emit(DeleteTripReservSuccess(message));
      } else {
        emit(DeleteTripReservError('Failed to delete the reservation'));
      }
    } catch (e) {
      emit(DeleteTripReservError(e.toString()));
    }
  }
}
