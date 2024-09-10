import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tourism/Features/flights/review/cubit/flight_review_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/Flight_review.dart';

class FlightReviewCubit extends Cubit<FlightReviewState> {
  FlightReviewCubit() : super(FlightReviewInitial());

  Future<void> fetchreview(int id) async {
    emit(FlightReviewLoading());

    try {
      String base_url = Api().base_url;

      final response = await Api()
          .get(url: '$base_url/showMobFlightReviews/$id', token: null);
      print('Fetching attraction reviews...');
      print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['data'] is String) {
          emit(FlightReviewEmpty(message: jsonResponse['message']));
        } else {
          final reviews = (jsonResponse['data'] as List<dynamic>)
              .map((review) =>
                  FlightReview.fromJson(review as Map<String, dynamic>))
              .toList();
          // dynamic jsonResponse = jsonDecode(response.body)['data'];
          // final reviews = (jsonResponse['data'] as List<dynamic>)
          //     .map((review) =>
          //         FlightReview.fromJson(review as Map<String, dynamic>))
          //     .toList();
          //   if (jsonResponse['status'] == 1) {
          // List<Map<String, dynamic>> reviewData =
          //     List<Map<String, dynamic>>.from(jsonResponse['reviews']);
          // List<FlightReview> reviews = reviewData
          //     .map((reviewJson) => FlightReview.fromJson(reviewJson))
          //     .toList();

          emit(FlightReviewSuccess(review: reviews));
        }
        //  }
        // else {
        //   emit(FlightReviewFailure(message: jsonResponse['message']));
        // }
      } else {
        emit(
            FlightReviewFailure(message: 'Failed to fetch attraction reviews'));
        print(response.body);
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(FlightReviewFailure(message: 'An error occurred'));
    }
  }

  Future<void> addFlightReview(int FlightId, String review) async {
    emit(FlightReviewLoading());

    try {
      String base_url = Api().base_url;
      String url = '${base_url}/addFlightReview/$FlightId';
      // dynamic requestBody = {
      //   "review": review,
      // };

      final response = await Api().post(
        url: url,
        body: {
          "review": review,
        },
        //jsonEncode(requestBody),
        token: 'your_token_here',
      );
      //prefs!.getString('token'));
      print('Adding attraction review...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 1) {
          emit(FlightReviewAddSuccess());
          await fetchreview(FlightId);
        } else {
          emit(FlightReviewFailure(message: jsonResponse['message']));
          print(response.body);
        }
      } else {
        print(response.body);
        emit(FlightReviewFailure(message: 'Failed to add attraction review'));
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(FlightReviewFailure(
          message: 'An error occurred while adding attraction review'));
    }
  }
}
