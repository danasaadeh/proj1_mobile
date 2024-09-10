import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/show_hotel_details/cubit/show_hotel_details_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/hotel_details.dart';

class ShowHotelDetailsCubit extends Cubit<ShowHotelDetailsState> {
  ShowHotelDetailsCubit() : super(ShowHotelDetailsInitial());
  List<HotelDetails>? hotel;
  void getHotelDetails(int? id) async {
    try {
      emit(ShowHotelDetailsLoading());
      String base_url = Api().base_url;
      final data =
          await Api().get(url: '$base_url/showHotelDetails/$id', token: null);

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final hotelDetails = HotelDetails.fromJson(responseData);

        emit(ShowHotelDetailsSuccess(hotelDetails: hotelDetails));
      } else {
        final errorMessage = 'Error ${data.statusCode}: ${data.reasonPhrase}';
        emit(ShowHotelDetailsFailure(message: errorMessage));
      }
    } on Exception catch (e) {
      emit(ShowHotelDetailsFailure(message: "Something went wrong: $e"));
    }
  }
}
