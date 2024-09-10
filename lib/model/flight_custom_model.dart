class flightInfo {
  final String nyc, ldn, date, depature, number, time;

  flightInfo( {
    required this.nyc,
    required this.time,
    required this.ldn,
    required this.date,
    required this.depature,
    required this.number,
  });
}

final List<flightInfo> Flights = [
  flightInfo(
      nyc: "New-York",
      ldn: "london",
      time: "8H 30M",
      date: "1 May",
      depature: "8:00 AM",
      number: "23"),
  flightInfo(
      nyc: "Dilhi",
      ldn: "Paris",
      time: "10H 30M",
      date: "3 March",
      depature: "6:00 AM",
      number: "24"),
  flightInfo(
      nyc: "Aleppo",
      ldn: "Tokyo",
      time: "6H 20M",
      date: "5 June",
      depature: "7:30 PM",
      number: "25"),
  flightInfo(
      nyc: "london",
      ldn: "Roma",
      time: "10H",
      date: "1 May",
      depature: "10:00 AM",
      number: "26"),
];
