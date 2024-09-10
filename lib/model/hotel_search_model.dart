import 'package:tourism/model/attraction_model.dart';

class Hotels {
  final int id;

  final String hotelName;
  final String location;
  final String description;
  final City city;
  final int stars;
  final String photo;
  bool fav;

  // final DateTime createdAt;
  // final DateTime updatedAt;

  Hotels(
      {required this.id,
      required this.hotelName,
      required this.location,
      required this.description,
      required this.city,
      required this.stars,
      required this.photo,
      required this.fav
      // required this.createdAt,
      // required this.updatedAt,
      });

  factory Hotels.fromJson(Map<String, dynamic> json) {
    return Hotels(
        id: json['id'],
        hotelName: json['hotel_name'],
        location: json['location'],
        description: json['description'],
        city: City.fromJson(json['city']),
        stars: json['stars'],
        photo: json['photo'],
        fav: json['isFavorite']
        // createdAt: DateTime.parse(json['created_at']),
        // updatedAt: DateTime.parse(json['updated_at']),
        );
  }
}
