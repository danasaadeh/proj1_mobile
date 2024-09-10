import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_state.dart';
import 'package:tourism/Features/flights/passenger/show_all/cubit/show_all_flight_passenegers_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/add_pass_model.dart';

class ShowAllFlightPassengersCubit extends Cubit<ShowAllFlightPassengersState> {
  ShowAllFlightPassengersCubit() : super(ShowAllFlightPassengersInitial());

  void getAllPassengers() async {
    try {
      emit(ShowAllFlightPassengersLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showAllFlightPassengers');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(ShowAllFlightPassengersEmpty(message: 'Empty'));
        } else if (responseData is List) {
          final passList = (responseData as List)
              .map((e) => AddPassenger.fromJson(e))
              .toList();
          emit(ShowAllFlightPassengersSuccess(
              pass: passList, message: 'success'));
        } else {
          // Unexpected data format
          emit(ShowAllFlightPassengersFailure(
              message: 'Unexpected data format'));
        }
      } else {
        emit(ShowAllFlightPassengersFailure(
            message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(ShowAllFlightPassengersFailure(message: "Something went wrong: $e"));
    }
  }
}
