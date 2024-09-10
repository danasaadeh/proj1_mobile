// ignore_for_file: depend_on_referenced_packages, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_state.dart';
import 'package:tourism/Features/home/cubit/home_cubit.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';

class Fav2Cubit extends Cubit<Fav2State> {
  Fav2Cubit() : super(Fav2Initial());
  late List<AttractionFav>? attrac;
  void getFav() async {
    try {
      emit(Fav2Loading());

      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showFavoriteAttraction');
      print(data.body.toString());
      if (data.statusCode == 200) {
        if (data.body is String) {
          emit(Fav2Empty(message: jsonDecode(data.body)["message"]));
        }
        List datamap = jsonDecode(data.body)["data"];
        attrac = List<AttractionFav>.from(
            datamap.map((e) => AttractionFav.fromJson(e)));
        emit(Fav2Success());
      } else {
        emit(Fav2Failure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      emit(Fav2Failure(message: "something is wrong ..."));
    }
  }

  void addToFav2(
      {required int id, required context, required bool is_home_page}) async {
    emit(Fav2Loading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/addAttractionToFavorite/$id",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(await data.body);
      print(data_map);
      if (data.statusCode == 200) {
        if (is_home_page) {
          BlocProvider.of<HomeCubit>(context)
              .attrac!
              .firstWhere((element) => element.attracId == id)
              .fav = true;
        } else {
          BlocProvider.of<AttracCubit>(context)
              .attrac!
              .firstWhere((element) => element.id == id)
              .fav = true;
        }

        emit(Fav2Success());
      } else {
        emit(Fav2Failure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(Fav2Failure(message: "there is something wrong.."));
    }
  }

  void removeFromFav2({
    required int id,
    required context,
    required bool is_Fav2s_page,
    required bool is_home_page,
  }) async {
    emit(Fav2Loading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/deleteAttractionFromFavorite/$id}",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(data.body);
      print(data_map);
      if (data.statusCode == 200) {
        if (is_Fav2s_page) {
          attrac!.removeWhere((element) => element.id == id);
        } else {
          if (is_home_page) {
            BlocProvider.of<HomeCubit>(context)
                .attrac!
                .firstWhere((element) => element.attracId == id)
                .fav = false;
          } else {
            BlocProvider.of<AttracCubit>(context)
                .attrac!
                .firstWhere((element) => element.id == id)
                .fav = false;
          }
        }
        emit(Fav2Success());
      } else {
        emit(Fav2Failure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(Fav2Failure(message: "there is something wrong.."));
    }
  }

  // void removeFromFavorite(
  //     {required id,
  //     required BuildContext context,
  //     required bool is_favorites_page}) {}
}
