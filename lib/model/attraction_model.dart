class Attraction {
  final int id;
  final String attractionName;
  final String openAt;
  final String closeAt;
  final String about;
  final City city;
  final AttractionType attractionType;
  final String attractionPhoto;
  bool fav;

  Attraction(
      {required this.id,
      required this.attractionName,
      required this.openAt,
      required this.closeAt,
      required this.about,
      required this.city,
      required this.attractionType,
      required this.attractionPhoto,
      required this.fav});

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
        id: json['id'],
        attractionName: json['attraction_name'],
        openAt: json['open_at'],
        closeAt: json['close_at'],
        about: json['about'],
        city: City.fromJson(json['city']),
        attractionType: AttractionType.fromJson(json['attraction_type']),
        attractionPhoto: json['attraction_photo'],
        fav: json['isFavorite']);
  }
}

class City {
  final int id;
  final String cityName;

  City({
    required this.id,
    required this.cityName,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: int.parse(json['id'].toString()),
      cityName: json['city_name'],
    );
  }
}

class AttractionType {
  final int id;
  final String attractionTypeName;

  AttractionType({
    required this.id,
    required this.attractionTypeName,
  });

  factory AttractionType.fromJson(Map<String, dynamic> json) {
    return AttractionType(
      id: json['id'],
      attractionTypeName: json['attraction_type_name'],
    );
  }
}

class AttractionFav {
  final int id;
  final String name;
  final String city;

  final List<FavPhotoAttrac> attractionPhoto;
  bool fav;

  AttractionFav(
      {required this.id,
      required this.name,
      required this.city,
      required this.attractionPhoto,
      required this.fav});

  factory AttractionFav.fromJson(Map<String, dynamic> json) {
    return AttractionFav(
        id: json['attraction_id'],
        name: json['attraction_name'],
        city: json['attraction_city'],
        attractionPhoto: (json['photo'] as List<dynamic>)
            .map((photo) => FavPhotoAttrac.fromJson(photo))
            .toList(),
        fav: json['isFavorite']);
  }
}

class FavPhotoAttrac {
  final String photo;

  FavPhotoAttrac({required this.photo});
  factory FavPhotoAttrac.fromJson(Map<String, dynamic> json) {
    return FavPhotoAttrac(photo: json['photo']);
  }
}
