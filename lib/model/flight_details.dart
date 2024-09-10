import 'package:tourism/model/attraction_model.dart';

class FlightDetails {
  final City fromCity;
  final City toCity;
  final String number;
  final String time;
  final String date;
  final List<String> checkedBaggage;
  final List<String> carryOnBaggage;
  final int price;

  FlightDetails({
    required this.fromCity,
    required this.toCity,
    required this.number,
    required this.time,
    required this.date,
    required this.checkedBaggage,
    required this.carryOnBaggage,
    required this.price,
  });

  factory FlightDetails.fromJson(Map<String, dynamic> json) {
    return FlightDetails(
      fromCity: City.fromJson(json['from_city']),
      toCity: City.fromJson(json['to_city']),
      number: json['number'],
      time: json['time'],
      date: json['date'],
      checkedBaggage: List<String>.from(json['checked_baggage']),
      carryOnBaggage: List<String>.from(json['carry_on_baggage']),
      price: json['price'],
    );
  }
}
