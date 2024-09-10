class FavHotel {
  final int id;
  final String name;
  final String city;
  final String location;
  final List<FavHotelPhoto> hotelPhoto;
  bool fav;

  FavHotel({
    required this.id,
    required this.name,
    required this.city,
    required this.hotelPhoto,
    required this.location,
    required this.fav,
  });

  factory FavHotel.fromJson(Map<String, dynamic> json) {
    return FavHotel(
        id: json['hotel_id'],
        name: json['hotel_name'],
        city: json['hotel_city'],
        location: json['location'],
        hotelPhoto: (json['photo'] as List<dynamic>)
            .map((photo) => FavHotelPhoto.fromJson(photo))
            .toList(),
        fav: json['isFavorite']);
  }
}

class FavHotelPhoto {
  final String photo;

  FavHotelPhoto({required this.photo});
  factory FavHotelPhoto.fromJson(Map<String, dynamic> json) {
    return FavHotelPhoto(photo: json['photo']);
  }
}
