import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/model/attraction_model.dart';

class AddPassengerCubit extends Cubit<AddPassengerState> {
  AddPassengerCubit() : super(AddPassengerInitial());
  List<City>? cities;
  AddPassenger? pass;
  Future<void> getFilters() async {
    emit(AddPassengerLoading());
    try {
      print("before api request!!");

      final data =
          await Api().get(url: "${Api().base_url}/getAllFliters", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List city_map = jsonDecode(data.body)["data"]["cities"];

        cities = List<City>.from(city_map.map((e) => City.fromJson(e)));

        emit(AddPassengerGotFiltersSuccess());
      } else {
        emit(AddPassengerFailure(message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(AddPassengerFailure(message: e.toString()));
    }
  }

  Future<void> AddTripPassenger({
    required String given_name,
    required String last_name,
    required String date_of_birth,
    required String city_id,
  }) async {
    emit(AddPassengerLoading());
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
          url: "$base_url/addPassenger",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        pass = AddPassenger.fromJson(responseData);
        emit(AddPassengerSuccess(add_pass: pass!, message: 'success'));
      } else if (data.statusCode == 422) {
        emit(AddPassengerFailure(message: json.decode(data.body)["message"]));
      } else {
        emit(AddPassengerFailure(message: json.decode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(AddPassengerFailure(message: "there is something wrong.."));
    }
  }

  /* Future<void> AddTripPassenger({
    required String given_name,
    required String last_name,
    required String date_of_birth,
    required String city_id,
  }) async {
    emit(AddPassengerLoading());
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
          url: "$base_url/addPassenger",
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body) 
        as List;
        pass = jsonData.map((e) => AddPassenger.fromJson(e)).toList();
        emit(AddPassengerSuccess(pass: pass!, message: 'success'));
      } else if (data.statusCode == 422) {
        emit(AddPassengerFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(AddPassengerFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(AddPassengerFailure(message: "there is something wrong.."));
    }
  }*/
}
