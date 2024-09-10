import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/flights/passenger/update/cubit/update_flight_passenger_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';

class UpdateFlightPassengerCubit extends Cubit<UpdateFlightPassengerState> {
  UpdateFlightPassengerCubit() : super(UpdateFlightPassengerInitial());
  List<City>? cities;
  Future<void> getFilters() async {
    emit(UpdateFlightPassengerLoading());
    try {
      print("before api request!!");

      final data =
          await Api().get(url: "${Api().base_url}/getAllFliters", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List city_map = jsonDecode(data.body)["data"]["cities"];

        cities = List<City>.from(city_map.map((e) => City.fromJson(e)));

        emit(UpdateFlightPassengerGotFiltersSuccess());
      } else {
        emit(UpdateFlightPassengerFailure(
            message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(UpdateFlightPassengerFailure(message: e.toString()));
    }
  }

  Future<void> EditFlightPassenger(
      {required String given_name,
      required String last_name,
      required String date_of_birth,
      required String city_id,
      required int id}) async {
    emit(UpdateFlightPassengerLoading());
    try {
      print("before api request!!");

      String base_url = Api().base_url;
      final requestBody = {
        'given_name': given_name,
        'last_name': last_name,
        'date_of_birth': date_of_birth,
        'city_id': city_id,
      };
      final data = await Api().post(
          url: "$base_url/updateFlightPassenger/$id",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        emit(UpdateFlightPassengerSuccess(message: 'success'));
      } else if (data.statusCode == 422) {
        emit(UpdateFlightPassengerFailure(
            message: jsonDecode(data.body)["message"]));
      } else {
        emit(UpdateFlightPassengerFailure(
            message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(UpdateFlightPassengerFailure(message: "there is something wrong.."));
    }
  }
}
