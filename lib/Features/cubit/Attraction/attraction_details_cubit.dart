import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/reveiw_model.dart';
import 'package:tourism/pages/attrac_details.dart';

part 'attraction_details_state.dart';

class AttractionDetailsCubit extends Cubit<AttractionDetailsState> {
  AttractionDetailsCubit() : super(AttractionDetailsInitial());

  Future<void> fetchreview(int id) async {
    emit(AttractionDetailsLoadingState());

    try {
      String base_url = Api().base_url;

      final response = await Api()
          .get(url: '$base_url/showAttractionReviews/$id', token: null);
      print('Fetching attraction reviews...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 1) {
          List<Map<String, dynamic>> reviewData =
              List<Map<String, dynamic>>.from(jsonResponse['data']);
          List<Review> reviews = reviewData
              .map((reviewJson) => Review.fromJson(reviewJson))
              .toList();

          emit(reviewDetailsLoadedState(reviews));
        } else {
          emit(AttractionDetailsErrorState(jsonResponse['message']));
        }
      } else {
        emit(AttractionDetailsErrorState('Failed to fetch attraction reviews'));
        print(response.body);
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(AttractionDetailsErrorState('An error occurred'));
    }
  }

  Future<void> addAttractionReview(int attractionId, String review) async {
    emit(AttractionDetailsLoadingState());

    try {
      String base_url = Api().base_url;
      String url = '${base_url}/addAttractionReview/$attractionId';
      dynamic requestBody = {
        "review": review,
      };

      final response = await Api()
          .post(url: url, body: requestBody, token: 'your_token_here');
      print('Adding attraction review...');
      print(response.body);

      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse['status'] == 1) {
          emit(AttractionReviewAddedState());
          await fetchreview(attractionId);
        } else {
          emit(AttractionDetailsErrorState(jsonResponse['message']));
          print(response.body);
        }
      } else {
        print(response.body);
        emit(AttractionDetailsErrorState('Failed to add attraction review'));
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(AttractionDetailsErrorState(
          'An error occurred while adding attraction review'));
    }
  }
}
