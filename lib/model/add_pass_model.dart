import 'package:tourism/model/attraction_model.dart';

class AddPassenger {
  final String givenName;
  final String lastName;
  final String dateOfBirth;
  final City city;
  final int id;

  AddPassenger({
    required this.givenName,
    required this.lastName,
    required this.dateOfBirth,
    required this.city,
    required this.id,
  });

  factory AddPassenger.fromJson(Map<String, dynamic> json) {
    return AddPassenger(
      givenName: json['given_name'],
      lastName: json['last_name'],
      dateOfBirth: json['date_of_birth'],
      city: City.fromJson(json['city']),
      id: json['id'],
    );
  }
}

class ShowPassenger {
  final String givenName;
  final String lastName;
  final String dateOfBirth;
  final City city;

  ShowPassenger({
    required this.givenName,
    required this.lastName,
    required this.dateOfBirth,
    required this.city,
  });

  factory ShowPassenger.fromJson(Map<String, dynamic> json) {
    return ShowPassenger(
      givenName: json['given_name'],
      lastName: json['last_name'],
      dateOfBirth: json['date_of_birth'],
      city: City.fromJson(json['city']),
    );
  }
}
