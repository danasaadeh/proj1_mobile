import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

import 'package:tourism/model/hotel_reserv_details.dart';

part 'hotel_reserv_details_state.dart';

class HotelReservDetailsCubit extends Cubit<HotelReservDetailsState> {
  HotelReservDetailsCubit() : super(HotelReservDetailsInitial());
  HotelReservation? hotel;
  Future<void> getHotelReservationDetails(int id) async {
    emit(HotelReservDetailsLoading());

    try {
      final data = await Api().get(
          url: '${Api().base_url}/showReservHotelDetails/$id',
          token: prefs!.getString('token'));

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);

        if (responseData != null && responseData.isNotEmpty) {
          hotel = HotelReservation.fromJson(responseData);
          emit(HotelReservDetailsSuccess(
              message: 'Success', reservation: hotel!));
        } else {
          emit(HotelReservDetailsEmpty(message: 'there is no Hotel details'));
        }
      } else {
        emit(HotelReservDetailsFailure(
            message: 'Failed to fetch hotel reservation details'));
      }
    } catch (e) {
      emit(HotelReservDetailsFailure(message: 'An error occurred: $e'));
    }
  }
}
