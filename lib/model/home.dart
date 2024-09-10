class FlightHome {
  final String number;
  final String fromCity;
  final String toCity;
  final String TotalTimeToArrive;
  final String derpatureDay;
  final String fromHour;

  FlightHome({
    required this.number,
    required this.fromCity,
    required this.toCity,
    required this.TotalTimeToArrive,
    required this.derpatureDay,
    required this.fromHour,
  });
  factory FlightHome.fromJson(Map<String, dynamic> json) {
    return FlightHome(
      number: json['number'],
      fromCity: json['from_city'],
      toCity: json['to_city'],
      TotalTimeToArrive: json['the total time to arrive'],
      fromHour: json['from hour'],
      derpatureDay: json['derpature day'],
    );
  }
}

class HotelHome {
  final int hotelId;
  final String hotelName;
  final String hotelCity;
  final String location;
  final String photo;
  bool fav;

  HotelHome(
      {required this.hotelId,
      required this.hotelName,
      required this.hotelCity,
      required this.location,
      required this.photo,
      required this.fav});
  factory HotelHome.fromJson(Map<String, dynamic> json) {
    return HotelHome(
        hotelId: json['hotel_id'],
        hotelName: json['hotel_name'],
        hotelCity: json['hotel_city'],
        location: json['location'],
        photo: json['photo'],
        fav: json['isFavorite']);
  }
}

class AttracHome {
  final int attracId;
  final String attracName;
  final String attracCity;
  final String photo;
  bool fav;

  AttracHome(
      {required this.attracId,
      required this.attracName,
      required this.attracCity,
      required this.photo,
      required this.fav});

  factory AttracHome.fromJson(Map<String, dynamic> json) {
    return AttracHome(
        attracId: json['attraction_id'],
        attracName: json['attraction_name'],
        attracCity: json['attraction_city'],
        photo: json['photo'],
        fav: json['isFavorite']);
  }
}
