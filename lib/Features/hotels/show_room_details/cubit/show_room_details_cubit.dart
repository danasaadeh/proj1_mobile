import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/show_room_details/cubit/show_room_details_state.dart';
import 'package:tourism/helper/api.dart';

import '../../../../model/room_details.dart';

class ShowRoomDetailsCubit extends Cubit<ShowRoomDetailsState> {
  ShowRoomDetailsCubit() : super(ShowRoomDetailsInitial());

  void getRoomDetails(int? id) async {
    try {
      emit(ShowRoomDetailsLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showRoomDetails/$id');

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final roomDetails = RoomDetails.fromJson(responseData);

        emit(ShowRoomDetailsSuccess(roomDetails: roomDetails));
      } else {
        final errorMessage = 'Error ${data.statusCode}: ${data.reasonPhrase}';
        emit(ShowRoomDetailsFailure(message: errorMessage));
      }
    } on Exception catch (e) {
      emit(ShowRoomDetailsFailure(message: "Something went wrong: $e"));
    }
  }
}
