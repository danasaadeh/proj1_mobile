class PaymentFlight {
  final String nyc, ldn,date, number, time,price;

  PaymentFlight( {
    required this.nyc,
    required this.time,
    required this.ldn,
   required this.date,
    required this.price,
    required this.number,
  });
}

final List<PaymentFlight> FlightsPayment = [
  PaymentFlight(
      nyc: "New-York",
      ldn: "london",
      time: "8H 30M",
      date: "1/4/2024",
      price:"400",
      number: "23"),
  PaymentFlight(
      nyc: "Dilhi",
      ldn: "Paris",
      time: "10H 30M",
      date: "3/5/2024",
      price:"360",
      number: "24"),
  PaymentFlight(
      nyc: "Aleppo",
      ldn: "Tokyo",
      time: "6H 20M",
      date: "25/12/2024",
      price:"150",
      number: "25"),
  PaymentFlight(
      nyc: "london",
      ldn: "Roma",
      time: "10H",
      date: "19/2/2024",
      price:"240",
      number: "26"),
];
