class RoomDetails {
  final List<RoomPhoto> roomPhotos;
  final String roomType;
  final String roomDetails;
  final int roomBeds;
  final int roomSleeps;
  final List<RoomFeature> roomFeatures;
  final String roomPrice;

  RoomDetails({
    required this.roomPhotos,
    required this.roomType,
    required this.roomDetails,
    required this.roomBeds,
    required this.roomSleeps,
    required this.roomFeatures,
    required this.roomPrice,
  });

  factory RoomDetails.fromJson(Map<String, dynamic> json) {
    return RoomDetails(
      roomPhotos: (json['room_photos'] as List<dynamic>)
          .map((e) => RoomPhoto.fromJson(e))
          .toList(),
      roomType: json['room_type'],
      roomDetails: json['room_details'],
      roomBeds: json['room_beds'],
      roomSleeps: json['room_sleeps'],
      roomFeatures: (json['room_features'] as List<dynamic>)
          .map((e) => RoomFeature.fromJson(e))
          .toList(),
      roomPrice: json['room_price'],
    );
  }
}

class RoomFeature {
  final String roomFeature;

  RoomFeature({
    required this.roomFeature,
  });

  factory RoomFeature.fromJson(Map<String, dynamic> json) {
    return RoomFeature(
      roomFeature: json['room_feature'],
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
