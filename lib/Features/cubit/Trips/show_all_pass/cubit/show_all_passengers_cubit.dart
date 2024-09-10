import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/add_pass_model.dart';

class ShowAllPassengersCubit extends Cubit<ShowAllPassengersState> {
  ShowAllPassengersCubit() : super(ShowAllPassengersInitial());
  List<AddPassenger>? pass;
  void getAllPassengers() async {
    try {
      emit(ShowAllPassengersLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showAllTripPassengers');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(ShowAllPassengersEmpty(message: 'Empty'));
        } else if (responseData is List) {
          pass = (responseData as List)
              .map((e) => AddPassenger.fromJson(e))
              .toList();
          emit(ShowAllPassengersSuccess(pass: pass!, message: 'success'));
        } else {
          // Unexpected data format
          emit(ShowAllPassengersFailure(message: 'Unexpected data format'));
        }
      } else {
        emit(ShowAllPassengersFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(ShowAllPassengersFailure(message: "Something went wrong: $e"));
    }
  }

  void deletePassenger(int passengerId, {required context}) async {
    emit(ShowAllPassengersLoading());
    try {
      // Perform the API call to delete the passenger with the given ID
      final data = await Api().get(
          url: "${Api().base_url}/deleteTripPassenger/$passengerId",
          token: prefs!.getString("token"));

      if (data.statusCode == 200) {
        BlocProvider.of<ShowAllPassengersCubit>(context).getAllPassengers();
        emit(ShowAllPassengersDeleteSuccess(
            message: 'Passenger deleted successfully'));
      } else {
        emit(ShowAllPassengersFailure(
            message: 'Failed to delete passenger. Please try again.'));
      }
    } catch (e) {
      emit(ShowAllPassengersFailure(message: 'An error occurred: $e'));
    }
  }
}
