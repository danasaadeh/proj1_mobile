import 'package:tourism/model/attraction_model.dart';

class FlightReservation {
  String airwayName;
  String flightTime;
  double adultPrice;
  double childPrice;
  List<Passenger> passengers;
  FlightReservationDetails reservationDetails;
  String timeBeforeFlightDay;

  FlightReservation({
    required this.airwayName,
    required this.flightTime,
    required this.adultPrice,
    required this.childPrice,
    required this.passengers,
    required this.reservationDetails,
    required this.timeBeforeFlightDay,
  });

  factory FlightReservation.fromJson(Map<String, dynamic> json) {
    var passengerList = json['passenger'] as List;
    List<Passenger> passengers = passengerList
        .map((passengerJson) => Passenger.fromJson(passengerJson))
        .toList();

    return FlightReservation(
      airwayName: json['airway_name'],
      flightTime: json['flightTime'],
      adultPrice: json['adult_price'].toDouble(),
      childPrice: json['child_price'].toDouble(),
      passengers: passengers,
      reservationDetails:
          FlightReservationDetails.fromJson(json['reservation_deatails']),
      timeBeforeFlightDay: json['time befor flight day'],
    );
  }
}

class Passenger {
  int id;
  City city;
  String givenName;
  String lastName;
  String dateOfBirth;

  Passenger({
    required this.id,
    required this.city,
    required this.givenName,
    required this.lastName,
    required this.dateOfBirth,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['id'],
      city: City.fromJson(json['city']),
      givenName: json['given_name'],
      lastName: json['last_name'],
      dateOfBirth: json['date_of_birth'],
    );
  }
}

class FlightReservationDetails {
  int id;
  int userId;
  String contactName;
  String phoneNumber;
  String email;
  int flightTimeId;
  int checkedBagNum;
  int adultsNum;
  int childrenNum;
  // int isProcessed;
  // String createdAt;
  // String updatedAt;
  int countOfPassenger;

  FlightReservationDetails({
    required this.id,
    required this.userId,
    required this.contactName,
    required this.phoneNumber,
    required this.email,
    required this.flightTimeId,
    required this.checkedBagNum,
    required this.adultsNum,
    required this.childrenNum,
    // required this.isProcessed,
    // required this.createdAt,
    // required this.updatedAt,
    required this.countOfPassenger,
  });

  factory FlightReservationDetails.fromJson(Map<String, dynamic> json) {
    return FlightReservationDetails(
      id: json['id'],
      userId: json['user_id'],
      contactName: json['caontact_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      flightTimeId: json['flight_time_id'],
      checkedBagNum: json['checkedBag_num'],
      adultsNum: json['adults_num'],
      childrenNum: json['children_num'],
      // isProcessed: json['is_processed'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
      countOfPassenger: json['count_of_passenger'],
    );
  }
}
