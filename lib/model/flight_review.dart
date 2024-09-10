class FlightReview {
  final int id;
  final String review;
  final String userName;
  final String flightId;

  FlightReview({
    required this.id,
    required this.review,
    required this.userName,
    required this.flightId,
  });

  factory FlightReview.fromJson(Map<String, dynamic> json) {
    return FlightReview(
      id: json['id'] as int,
      review: json['review'] as String,
      userName: json['user_name'] as String,
      flightId: json['flight_id'] as String,
      // id: json['id'],
      // review: json['review'],
      // userName: json['user_name'],
      // flightId: json['flight_id'],
    );
  }
}
