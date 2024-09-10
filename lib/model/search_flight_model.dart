import 'package:tourism/model/attraction_model.dart';

class AvailableFlight {
  final City fromCity;
  final City toCity;
  final String theTotalTimeToArrive;
  final String derpatureDay;
  final String fromHour;
  final String number;
  final int flightTimeId;

  AvailableFlight({
    required this.fromCity,
    required this.toCity,
    required this.theTotalTimeToArrive,
    required this.derpatureDay,
    required this.fromHour,
    required this.number,
    required this.flightTimeId,
  });

  factory AvailableFlight.fromJson(Map<String, dynamic> json) {
    return AvailableFlight(
      fromCity: City.fromJson(json['from_city']),
      toCity: City.fromJson(json['to_city']),
      theTotalTimeToArrive: json['the total time to arrive'],
      derpatureDay: json['derpature day'],
      fromHour: json['from hour'],
      number: json['number'],
      flightTimeId: json['flight_time_id'],
    );
  }
}

class FlightClass {
  final int id;
  final String name;
  FlightClass({required this.id, required this.name});
  factory FlightClass.fromjson(jsonData) {
    return FlightClass(id: jsonData['id'], name: jsonData['name']);
  }
}
