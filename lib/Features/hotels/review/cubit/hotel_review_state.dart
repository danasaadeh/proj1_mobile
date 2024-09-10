import 'package:tourism/model/hotel_review.dart';

abstract class HotelReviewState {}

final class HotelReviewInitial extends HotelReviewState {}

final class HotelReviewSuccess extends HotelReviewState {
  final List<HotelReview> review;

  HotelReviewSuccess({required this.review});
}

final class HotelReviewAddSuccess extends HotelReviewState {}

final class HotelReviewLoading extends HotelReviewState {}

final class HotelReviewEmpty extends HotelReviewState {
  final String message;

  HotelReviewEmpty({required this.message});
}

final class HotelReviewFailure extends HotelReviewState {
  final String message;
  HotelReviewFailure({required this.message});
}
