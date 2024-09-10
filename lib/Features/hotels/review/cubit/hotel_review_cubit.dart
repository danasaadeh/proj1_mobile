import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/hotels/review/cubit/hotel_review_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/hotel_review.dart';

class HotelReviewCubit extends Cubit<HotelReviewState> {
  HotelReviewCubit() : super(HotelReviewInitial());

  Future<void> fetchreview(int id) async {
    emit(HotelReviewLoading());

    try {
      String base_url = Api().base_url;

      final response = await Api()
          .get(url: '$base_url/showMobHotelReviews/$id', token: null);
      print('Fetching attraction reviews...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        if (jsonResponse['reviews'] is String) {
          emit(HotelReviewEmpty(message: jsonResponse['message']));
        } else {
          //   if (jsonResponse['status'] == 1) {
          List<Map<String, dynamic>> reviewData =
              List<Map<String, dynamic>>.from(jsonResponse['reviews']);
          List<HotelReview> reviews = reviewData
              .map((reviewJson) => HotelReview.fromJson(reviewJson))
              .toList();

          emit(HotelReviewSuccess(review: reviews));
        }
        //  }
        // else {
        //   emit(HotelReviewFailure(message: jsonResponse['message']));
        // }
      } else {
        emit(HotelReviewFailure(message: 'Failed to fetch attraction reviews'));
        print(response.body);
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(HotelReviewFailure(message: 'An error occurred'));
    }
  }

  Future<void> addHotelReview(int hotelId, String review) async {
    emit(HotelReviewLoading());

    try {
      String base_url = Api().base_url;
      String url = '${base_url}/addHotelReview/$hotelId';
      dynamic requestBody = {
        "review": review,
      };

      final response = await Api().post(
        url: url,
        body: requestBody,
        //jsonEncode(requestBody),
        token: 'your_token_here',
      );
      //prefs!.getString('token'));
      print('Adding attraction review...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 1) {
          emit(HotelReviewAddSuccess());
          await fetchreview(hotelId);
        } else {
          emit(HotelReviewFailure(message: jsonResponse['message']));
          print(response.body);
        }
      } else {
        print(response.body);
        emit(HotelReviewFailure(message: 'Failed to add attraction review'));
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(HotelReviewFailure(
          message: 'An error occurred while adding attraction review'));
    }
  }
}
