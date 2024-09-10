import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/search/cubit/search_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/hotel_search_model.dart';

class SearchHotelCubit extends Cubit<SearchHotelState> {
  SearchHotelCubit() : super(SearchHotelInitial());
  List<Hotels>? hotels;
  List<City>? cities;
  Future<void> getFilters() async {
    emit(SearchHotelLoading());
    try {
      print("before api request!!");

      final data =
          await Api().get(url: "${Api().base_url}/getAllFliters", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List city_map = jsonDecode(data.body)["data"]["cities"];

        cities = List<City>.from(city_map.map((e) => City.fromJson(e)));

        emit(SearchHotelGotFiltersSuccess());
      } else {
        emit(SearchHotelFailure(message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(SearchHotelFailure(message: e.toString()));
    }
  }

  Future<void> SearchHotel({
    required String rate,
    required String city_id,
    required String in_date,
    required String out_date,
    required String room_num,
    required String person_num,
  }) async {
    emit(SearchHotelLoading());
    try {
      print("before api request!!");

      String base_url = Api().base_url;
      final requestBody = {
        "city_id": city_id,
        "rate": rate,
        "in_date": in_date,
        "out_date": out_date,
        "room_numbers": room_num,
        "number_of_persons": person_num
      };
      final data = await Api().post(
          url: "$base_url/searchForHotelRoom",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['hotels'] == null) {
          emit(SearchHotelEmpty(message: "there is no hotels like this"));
        } else {
          // hotels = (response['hotels'] as List)
          //     .map((e) => Hotels.fromJson(e['hotels']))
          //     .toList();
          hotels = (response['hotels'] as List)
              .map((e) => Hotels.fromJson(e))
              .toList();
          emit(SearchHotelSuccess(
              hotels: hotels!, message: jsonDecode(data.body)["message"]));
        }
      } else if (data.statusCode == 422) {
        emit(SearchHotelFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchHotelFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchHotelFailure(message: "there is something wrong.."));
    }
  }
}
