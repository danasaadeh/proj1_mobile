import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_state.dart';
import 'package:tourism/Features/home/cubit/home_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

import 'package:tourism/model/attraction_model.dart';

class AttracCubit extends Cubit<AttracState> {
  AttracCubit() : super(AttracInitial());
  List<Attraction>? attrac;
  // void fetchAttrac() async {
  //   emit(AttracLoading());

  //   try {
  //     String base_url = Api().base_url;

  //     final data = await Api().get(url: '$base_url/showAllAttractionMobile');
  //     if (data.statusCode == 200) {
  //       final response = jsonDecode(data.body);

  //       if (response['data'] is List) {
  //         var datamap = jsonDecode(data.body)["data"][0]["attraction"];
  //         attrac =
  //             List<Attraction>.from(datamap.map((e) => Attraction.fromJson(e)));
  //         emit(AttracSuccess(attrac: attrac!));
  //       } else {
  //         emit(AttracFailure(message: 'Invalid response format'));
  //       }
  //     } else {
  //       emit(AttracFailure(message: 'Failed to fetch all Attracs'));
  //     }
  //   } catch (e) {
  //     emit(AttracFailure(message: 'An error occurred'));
  //   }
  // }

  void fetchAttrac() async {
    emit(AttracLoading());

    try {
      String baseUrl = Api().base_url;
      final data = await Api().get(url: '$baseUrl/showAllAttractionMobile');

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['status'] == 1) {
          final attractionList =
              List<Map<String, dynamic>>.from(response['data']);
          attrac = attractionList
              .map((e) => Attraction.fromJson(e['attraction']))
              .toList();
          emit(AttracSuccess(attrac: attrac!));
        } else {
          emit(AttracFailure(message: 'Failed to fetch all attractions'));
        }
      } else {
        emit(AttracFailure(message: 'Failed to fetch all attractions'));
      }
    } catch (e) {
      emit(AttracFailure(message: 'An error occurred'));
    }
  }

  void getAttracDetails({int? id}) async {
    emit(AttracLoading());

    try {
      String baseUrl = Api().base_url;
      final data =
          await Api().get(url: '$baseUrl/showDetailsForOneAttraction/$id');

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['status'] == 1) {
          final attracDetails = (response['data'] as List)
              .map((e) => Attraction.fromJson(e))
              .toList();
          emit(AttracSuccess(attrac: attracDetails));
        } else {
          emit(AttracFailure(message: 'Failed to fetch all attractions'));
        }
      } else {
        emit(AttracFailure(message: 'Failed to fetch all attractions'));
      }
    } catch (e) {
      emit(AttracFailure(message: 'An error occurred'));
    }
  }

  void searchAttractions(String query) {
    final currentState = state;

    if (query.isEmpty) {
      fetchAttrac();
      return;
    }

    final normalizedQuery = query.toLowerCase();

    if (currentState is AttracSuccess) {
      final filteredAttractions = currentState.attrac.where((attraction) {
        final attractionName = attraction.attractionName.toLowerCase();
        final city = attraction.city.cityName.toLowerCase();

        return attractionName.contains(normalizedQuery) ||
            city.contains(normalizedQuery);
      }).toList();

      emit(AttracSuccess(attrac: filteredAttractions));
    }
  }

  void addToFavorite({
    required int id,
  }) async {
    try {
      emit(AttracLoading());
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().post(
        url: "$base_url/addAttractionToFavorite/$id)}",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(data.body);
      print(data_map);
      if (data.statusCode == 200) {
        print(attrac!.firstWhere((element) => element.id == id).fav);
        attrac!.firstWhere((element) => element.id == id).fav = true;
        print(attrac!.firstWhere((element) => element.id == id).fav);
        emit(AttracSuccess(attrac: attrac!));
      } else {
        emit(AttracFailure(message: data_map["message"] ?? data_map["errors"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(AttracFailure(message: "there is something wrong.."));
    }
  }
}
