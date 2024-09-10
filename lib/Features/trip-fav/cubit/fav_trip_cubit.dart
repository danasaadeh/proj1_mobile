// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/cubit/Trips/trip_cubit.dart';

import 'package:tourism/Features/trip-fav/cubit/fav_trip_state.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/trips_model.dart';

class FavTripCubit extends Cubit<FavTripState> {
  FavTripCubit() : super(FavTripInitial());
  List<FavTrip>? trip;
  void getFav() async {
    try {
      emit(FavTripLoading());

      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showFavoriteTrip');
      print(data.body.toString());
      if (data.statusCode == 200) {
        if (data.body is String) {
          emit(FavTripEmpty(message: jsonDecode(data.body)["message"]));
        }
        List datamap = jsonDecode(data.body)["data"];
        trip = List<FavTrip>.from(datamap.map((e) => FavTrip.fromJson(e)));
        emit(FavTripSuccess());
      } else {
        emit(FavTripFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      emit(FavTripFailure(message: "something is wrong ..."));
    }
  }

  void addToFavTrip({required int id, required context}) async {
    emit(FavTripLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/addTripToFavorite/$id",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(await data.body);
      print(data_map);
      if (data.statusCode == 200) {
        BlocProvider.of<TripCubit>(context)
            .trip!
            .firstWhere((element) => element.id == id)
            .fav = true;
        emit(FavTripSuccess());
      } else {
        emit(FavTripFailure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(FavTripFailure(message: "there is something wrong.."));
    }
  }

  void removeFromFavTrip({
    required int id,
    required context,
    required bool is_FavTrips_page,
  }) async {
    emit(FavTripLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/deleteTripFromFavorite/$id}",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(data.body);
      print(data_map);
      if (data.statusCode == 200) {
        if (is_FavTrips_page) {
          trip!.removeWhere((element) => element.id == id);
        } else {
          BlocProvider.of<TripCubit>(context)
              .trip!
              .firstWhere((element) => element.id == id)
              .fav = false;
        }
        emit(FavTripSuccess());
      } else {
        emit(FavTripFailure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(FavTripFailure(message: "there is something wrong.."));
    }
  }
}
