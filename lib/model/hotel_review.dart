class HotelReview {
  final int id;
  final String review;
  final String userName;
  final String hotelId;

  HotelReview({
    required this.id,
    required this.review,
    required this.userName,
    required this.hotelId,
  });

  factory HotelReview.fromJson(Map<String, dynamic> json) {
    return HotelReview(
      id: json['id'] as int,
      review: json['review'] as String,
      userName: json['user_name'] as String,
      hotelId: json['hotel_id'] as String,
    );
  }
}
