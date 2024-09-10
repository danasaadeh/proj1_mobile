import 'package:tourism/model/Flight_review.dart';

abstract class FlightReviewState {}

final class FlightReviewInitial extends FlightReviewState {}

final class FlightReviewSuccess extends FlightReviewState {
  final List<FlightReview> review;

  FlightReviewSuccess({required this.review});
}

final class FlightReviewAddSuccess extends FlightReviewState {}

final class FlightReviewLoading extends FlightReviewState {}

final class FlightReviewEmpty extends FlightReviewState {
  final String message;

  FlightReviewEmpty({required this.message});
}

final class FlightReviewFailure extends FlightReviewState {
  final String message;
  FlightReviewFailure({required this.message});
}
