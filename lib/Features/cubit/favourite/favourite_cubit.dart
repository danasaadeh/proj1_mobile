import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/trips_model.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  // void showFavoriteAttraction() async {
  //   try {
  //     emit(FavouriteLoading());
  //     String base_url = Api().base_url;
  //     final data = await Api().get(url: '$base_url/showFavoriteAttraction');
  //     if (data.statusCode == 200) {
  //       print('20000000');
  //       final responseData = jsonDecode(data.body);
  //       print('after decodeeeee');
  //       if (responseData.isEmpty) {
  //         // No hotel information available
  //         emit(FavouriteEmpty(message: 'Empty'));
  //       } else if (responseData is List) {
  //         final attractionList = responseData.map((attractionJson) {
  //           final attraction = Attraction.fromJson(attractionJson);
  //           return attraction;
  //         }).toList();
  //         final attractionIds =
  //             List<int>.from(responseData.map((item) => item['attraction_id']));
  //         emit(FavouriteAttracSuccess(
  //             attrac: attractionIds, attraction: attractionList));
  //       } else {
  //         // Unexpected data format
  //         emit(FavouriteFailure(message: 'Unexpected data format'));
  //       }
  //     } else {
  //       emit(FavouriteFailure(message: 'Error fetching admin data'));
  //     }
  //   } on Exception catch (e) {
  //     emit(FavouriteFailure(message: "Something went wrong: $e"));
  //   }
  // }

  // void showFavoriteTrip() async {
  //   try {
  //     emit(FavouriteLoading());
  //     String base_url = Api().base_url;
  //     final data = await Api().get(url: '$base_url/showFavoriteAttraction');
  //     if (data.statusCode == 200) {
  //       print('20000000');
  //       final responseData = jsonDecode(data.body);
  //       print('after decodeeeee');
  //       if (responseData.isEmpty) {
  //         // No hotel information available
  //         emit(FavouriteEmpty(message: 'Empty'));
  //       } else if (responseData is List) {
  //         final tripList =
  //             (responseData as List).map((e) => Trip.fromJson(e)).toList();
  //         emit(FavouriteTripSuccess(trip: tripList));
  //       } else {
  //         // Unexpected data format
  //         emit(FavouriteFailure(message: 'Unexpected data format'));
  //       }
  //     } else {
  //       emit(FavouriteFailure(message: 'Error fetching admin data'));
  //     }
  //   } on Exception catch (e) {
  //     emit(FavouriteFailure(message: "Something went wrong: $e"));
  //   }
  // }
}
