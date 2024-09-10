class HotelDetails {
  final String hotelName;
  final int hotelStars;
  final String hotelCity;
  final String hotelLocation;
  final String hotelDescription;
  final List<HotelFacility> hotelFacilities;
  final List<HotelPhoto> hotelPhotos;
  final List<HotelRoom> hotelRooms;
  final bool isFavorite;

  HotelDetails({
    required this.hotelName,
    required this.hotelStars,
    required this.hotelCity,
    required this.hotelLocation,
    required this.hotelDescription,
    required this.hotelFacilities,
    required this.hotelPhotos,
    required this.hotelRooms,
    required this.isFavorite,
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) {
    return HotelDetails(
      hotelName: json['hotel_name'],
      hotelStars: json['hotel_stars'],
      hotelCity: json['hotel_city'],
      hotelLocation: json['hotel_location'],
      hotelDescription: json['hotel_description'],
      hotelFacilities: (json['hotel_facilities'] as List<dynamic>)
          .map((e) => HotelFacility.fromJson(e))
          .toList(),
      hotelPhotos: (json['hotel_photos'] as List<dynamic>)
          .map((e) => HotelPhoto.fromJson(e))
          .toList(),
      hotelRooms: (json['hotel_rooms'] as List<dynamic>)
          .map((e) => HotelRoom.fromJson(e))
          .toList(),
      isFavorite: json['isFavorite'],
    );
  }
}

class HotelFacility {
  final String hotelFacility;

  HotelFacility({
    required this.hotelFacility,
  });

  factory HotelFacility.fromJson(Map<String, dynamic> json) {
    return HotelFacility(
      hotelFacility: json['hotel_facility'],
    );
  }
}

class HotelPhoto {
  final String hotelPhoto;

  HotelPhoto({
    required this.hotelPhoto,
  });

  factory HotelPhoto.fromJson(Map<String, dynamic> json) {
    return HotelPhoto(
      hotelPhoto: json['hotel_photo'],
    );
  }
}

class HotelRoom {
  final int roomId;
  final String roomType;
  final List<RoomPhoto> roomPhotos;
  final String priceForNight;

  HotelRoom({
    required this.roomId,
    required this.roomType,
    required this.roomPhotos,
    required this.priceForNight,
  });

  factory HotelRoom.fromJson(Map<String, dynamic> json) {
    return HotelRoom(
      roomId: json['room_id'],
      roomType: json['room_type'],
      roomPhotos: (json['room_photos'] as List<dynamic>)
          .map((e) => RoomPhoto.fromJson(e))
          .toList(),
      priceForNight: json['price_for_night'],
    );
  }
}

class RoomPhoto {
  final String roomPhoto;

  RoomPhoto({
    required this.roomPhoto,
  });

  factory RoomPhoto.fromJson(Map<String, dynamic> json) {
    return RoomPhoto(
      roomPhoto: json['room_photo'],
    );
  }
}
