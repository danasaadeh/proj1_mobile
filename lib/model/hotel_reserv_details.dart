class HotelReservation {
  String hotel;
  String roomType;
  String price;
  HotelReservationDetails reservationDetails;
  // String timeBeforeFlightDay;

  HotelReservation({
    required this.hotel,
    required this.roomType,
    required this.price,
    required this.reservationDetails,
    //required this.timeBeforeFlightDay,
  });

  factory HotelReservation.fromJson(Map<String, dynamic> json) {
    return HotelReservation(
      hotel: json['hotel'],
      roomType: json['roomType'],
      price: json['price'],
      reservationDetails:
          HotelReservationDetails.fromJson(json['reservation_deatails']),
      // timeBeforeFlightDay: json['time befor flight day'],
    );
  }
}

class HotelReservationDetails {
  int id;
  String fromDay;
  String toDay;
  String fullName;
  String phoneNumber;
  int userId;
  int roomId;
  // int isProcessed;
  // String createdAt;
  // String updatedAt;

  HotelReservationDetails({
    required this.id,
    required this.fromDay,
    required this.toDay,
    required this.fullName,
    required this.phoneNumber,
    required this.userId,
    required this.roomId,
    // required this.isProcessed,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory HotelReservationDetails.fromJson(Map<String, dynamic> json) {
    return HotelReservationDetails(
      id: json['id'],
      fromDay: json['from_day'],
      toDay: json['to_day'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      userId: json['user_id'],
      roomId: json['room_id'],
      // isProcessed: json['is_processed'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
    );
  }
}
