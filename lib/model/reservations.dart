import 'package:tourism/model/attraction_model.dart';

class HotelAllReservation {
  int id;
  String photo;
  String phoneNumber;
  String fullName;
  int roomId;
  String fromDay;
  String toDay;
  City city;
  String hotelName;
  int stars;

  HotelAllReservation({
    required this.id,
    required this.phoneNumber,
    required this.fullName,
    required this.roomId,
    required this.fromDay,
    required this.toDay,
    required this.city,
    required this.hotelName,
    required this.stars,
    required this.photo,
  });

  factory HotelAllReservation.fromJson(Map<String, dynamic> json) {
    return HotelAllReservation(
      id: json['id'],
      photo: json['photo'],
      phoneNumber: json['phone_number'],
      fullName: json['full_name'],
      roomId: json['room_id'],
      fromDay: json['from_day'],
      toDay: json['to_day'],
      city: City.fromJson(json['city']),
      hotelName: json['hotel_name'],
      stars: json['stars'],
    );
  }
}

class TripAllReservation {
  int id;

  int tripId;
  String contactName;
  String phoneNumber;
  String email;
  int countOfPassenger;
  String tripName;
  String destination;
  int numberOfDays;
  String fromDate;
  String toDate;
  String photo;

  TripAllReservation({
    required this.id,
    required this.tripId,
    required this.contactName,
    required this.phoneNumber,
    required this.email,
    required this.countOfPassenger,
    required this.tripName,
    required this.destination,
    required this.numberOfDays,
    required this.fromDate,
    required this.toDate,
    required this.photo,
  });

  factory TripAllReservation.fromJson(Map<String, dynamic> json) {
    return TripAllReservation(
      photo: json['photo'],
      id: json['id'],
      tripId: json['trip_id'],
      contactName: json['caontact_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      countOfPassenger: json['count_of_passenger'],
      tripName: json['trip_name'],
      destination: json['destination'],
      numberOfDays: json['number_of_days'],
      fromDate: json['from_date'],
      toDate: json['to_date'],
    );
  }
}

class FlightAllReservation {
  int id;

  String contactName;
  String phoneNumber;
  String email;
  int flightTimeId;
  int checkedBagNum;
  int adultsNum;
  int childrenNum;
  int countOfPassenger;
  City fromCity;
  City toCity;
  String fromHour;
  String toHour;
  String departureDay;

  FlightAllReservation({
    required this.id,
    required this.contactName,
    required this.phoneNumber,
    required this.email,
    required this.flightTimeId,
    required this.checkedBagNum,
    required this.adultsNum,
    required this.childrenNum,
    required this.countOfPassenger,
    required this.fromCity,
    required this.toCity,
    required this.fromHour,
    required this.toHour,
    required this.departureDay,
  });

  factory FlightAllReservation.fromJson(Map<String, dynamic> json) {
    return FlightAllReservation(
      id: json['id'],
      contactName: json['caontact_name'] as String,
      phoneNumber: json['phone_number'],
      email: json['email'],
      flightTimeId: json['flight_time_id'],
      checkedBagNum: json['checkedBag_num'],
      adultsNum: json['adults_num'],
      childrenNum: json['children_num'],
      countOfPassenger: json['count_of_passenger'],
      fromCity: City.fromJson(json['from_city']),
      toCity: City.fromJson(json['to_city']),
      fromHour: json['from_hour'],
      toHour: json['to_hour'],
      departureDay: json['departure_day'],
    );
  }
}
