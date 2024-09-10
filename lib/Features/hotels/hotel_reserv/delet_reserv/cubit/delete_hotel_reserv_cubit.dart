import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/hotel_reserv/delet_reserv/cubit/delete_hotel_reserv_state.dart';
import 'package:tourism/helper/api.dart';

class DeleteHotelReservCubit extends Cubit<DeleteHotelReservState> {
  DeleteHotelReservCubit() : super(DeleteHotelReservInitial());

  Future<void> deleteDeleteHotelReserv(int id) async {
    emit(DeleteHotelReservLoading());
    try {
      final response =
          await Api().get(url: "${Api().base_url}/deleteHotelReserv/$id");

      if (response.statusCode == 200) {
        // Assuming the response body contains a message
        final responseData = json.decode(response.body);
        String message =
            responseData['message'] ?? "The reserve can't be deleted";

        emit(DeleteHotelReservSuccess(message));
      } else {
        emit(DeleteHotelReservError('Failed to delete the reservation'));
      }
    } catch (e) {
      emit(DeleteHotelReservError(e.toString()));
    }
  }
}
