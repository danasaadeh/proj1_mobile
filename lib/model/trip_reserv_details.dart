import 'package:tourism/model/attraction_model.dart';

class Passenger {
  int id;
  City city;
  String givenName;
  String lastName;
  String dateOfBirth;

  Passenger(
      {required this.id,
      required this.city,
      required this.givenName,
      required this.lastName,
      required this.dateOfBirth});

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

class TripReservationDetails {
  int id;
  String contactName;
  String phoneNumber;
  String email;
  int userId;
  int tripId;
  int countOfPassenger;
  // int isProcessed;
  // String createdAt;
  // String updatedAt;

  TripReservationDetails({
    required this.id,
    required this.contactName,
    required this.phoneNumber,
    required this.email,
    required this.userId,
    required this.tripId,
    required this.countOfPassenger,
    // required this.isProcessed,
    // required this.createdAt,
    // required this.updatedAt
  });

  factory TripReservationDetails.fromJson(Map<String, dynamic> json) {
    return TripReservationDetails(
      id: json['id'],
      contactName: json['caontact_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      userId: json['user_id'],
      tripId: json['trip_id'],
      countOfPassenger: json['count_of_passenger'],
      // isProcessed: json['is_processed'],
      // createdAt: json['created_at'],
      // updatedAt: json['updated_at'],
    );
  }
}

class TripReservation {
  String tripName;
  String tripDate;
  String price;
  List<Passenger> passenger;
  TripReservationDetails reservationDetails;
  String timeBeforeFlightDay;

  TripReservation(
      {required this.tripName,
      required this.tripDate,
      required this.price,
      required this.passenger,
      required this.reservationDetails,
      required this.timeBeforeFlightDay});

  factory TripReservation.fromJson(Map<String, dynamic> json) {
    return TripReservation(
      tripName: json['Trip_Name'],
      tripDate: json['tripDate'],
      price: json['price'],
      passenger: List<Passenger>.from(
          json['passenger'].map((x) => Passenger.fromJson(x))),
      reservationDetails:
          TripReservationDetails.fromJson(json['reservation_deatails']),
      timeBeforeFlightDay: json['time befor flight day'],
    );
  }
}
