import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/trips_model.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  // final Map<int, bool> _favoriteTrips = {};
  TripCubit() : super(TripInitial());
  List<Trip>? trip;
  // void toggleFavorite(int TripId) {
  //   bool isFavorite = _favoriteTrips[TripId] ?? false;
  //   _favoriteTrips[TripId] = !isFavorite;

  //   if (isFavorite) {
  //     emit(FavoriteInSuccessState());
  //     showAllTrip();
  //   } else {
  //     emit(FavoriteSuccessState());
  //     addToFavorite(TripId);
  //   }
  // }

  // bool isFavorite(int TripId) {
  //   return _favoriteTrips[TripId] ?? false;
  // }

  void showAllTrip() async {
    try {
      emit(TripLoadingState());
      String base_url = Api().base_url;
      final data =
          await Api().get(url: '$base_url/showMobAllTrips', token: null);
      print('.....................Trip ......');
      if (data.statusCode == 200) {
        final responseData = json.decode(data.body);
        print('2000000.......trip.................');
        print('responseData: $responseData');

        if (responseData['status'] == 1) {
          List datamap = jsonDecode(data.body)["data"];

          trip = List<Trip>.from(datamap.map((e) => Trip.fromJson(e)));
          emit(TripLoadedState(trip: trip!));
        } else {
          emit(TripErrorState(responseData['message']));
        }
      } else {
        emit(TripErrorState('Error fetching admin data'));
      }
    } on Exception catch (e) {
      print('Error occurred: $e');
      emit(TripErrorState("Something went wrong: $e"));
    }
  }

  // Future<void> addToFavorite(int TripId) async {
  //   try {
  //     String base_url = Api().base_url;

  //     final response = await Api()
  //         .get(url: '$base_url/addTripToFavorite/$TripId', token: null);
  //     print('Adding Trip to favorites...');

  //     if (response.statusCode == 200) {
  //       dynamic jsonResponse = jsonDecode(response.body);

  //       if (jsonResponse is Map<String, dynamic>) {

  //         _favoriteTrips[TripId] = true;

  //         emit(FavoriteSuccessState());

  //         showAllTrip();
  //       } else {
  //         emit(TripErrorState(jsonResponse['message']));
  //       }
  //     } else {
  //       emit(TripErrorState('Failed to add Trip to favorites'));
  //       print(response.body);
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //     emit(TripErrorState('An error occurred'));
  //   }
  // }
}
