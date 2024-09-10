class Review {
  final int id;
  final String review;
  final String userName;
  final int attractionId;

  Review({
    required this.id,
    required this.review,
    required this.userName,
    required this.attractionId,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      review: json['review'],
      userName: json['user_name'],
      attractionId: json['attraction_id'],
    );
  }
}
