import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/editpassenger/editpassenger_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';

class EditPassengerCubit extends Cubit<EditPassengerState> {
  EditPassengerCubit() : super(EditPassengerInitial());
  List<City>? cities;
  Future<void> getFilters() async {
    emit(EditPassengerLoading());
    try {
      print("before api request!!");

      final data =
          await Api().get(url: "${Api().base_url}/getAllFliters", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List city_map = jsonDecode(data.body)["data"]["cities"];

        cities = List<City>.from(city_map.map((e) => City.fromJson(e)));

        emit(EditPassengerGotFiltersSuccess());
      } else {
        emit(EditPassengerFailure(message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(EditPassengerFailure(message: e.toString()));
    }
  }

  Future<void> EditTripPassenger(
      {required String given_name,
      required String last_name,
      required String date_of_birth,
      required String city_id,
      required int id}) async {
    emit(EditPassengerLoading());
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
          url: "$base_url/updateTripPassenger/$id",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        emit(EditPassengerSuccess(message: 'success'));
      } else if (data.statusCode == 422) {
        emit(EditPassengerFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(EditPassengerFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(EditPassengerFailure(message: "there is something wrong.."));
    }
  }
}
