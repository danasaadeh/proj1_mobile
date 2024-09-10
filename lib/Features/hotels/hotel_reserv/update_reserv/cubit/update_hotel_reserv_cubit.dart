import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/hotel_reserv/update_reserv/cubit/update_hotel_reserv_state.dart';
import 'package:tourism/Features/hotels/reserv/cubit/reserv_room_state.dart';
import 'package:tourism/Features/hotels/search/cubit/search_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class UpdateHotelReservCubit extends Cubit<UpdateHotelReservState> {
  UpdateHotelReservCubit() : super(UpdateHotelReservInitial());
  Future<void> UpdateHotelReserv({
    required String phone_num,
    required String full_name,
    required String from_day,
    required String to_day,
    required String wallet_pass,
    required int id,
  }) async {
    emit(UpdateHotelReservLoading());
    try {
      print("before api request!!");

      String base_url = Api().base_url;
      final requestBody = {
        "from_day": from_day,
        "to_day": to_day,
        "wallet_password": wallet_pass,
        "phone_number": phone_num,
        "full_name": full_name,
      };
      final data = await Api().post(
          url: "$base_url/updateHotelReserv/$id",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        //data.body.toString()
        emit(UpdateHotelReservSuccess(message: responseData[0]));
      } else if (data.statusCode == 422) {
        emit(UpdateHotelReservFailure(
            message: jsonDecode(data.body)["message"]));
      } else {
        emit(UpdateHotelReservFailure(
            message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(UpdateHotelReservFailure(message: "there is something wrong.."));
    }
  }
}
