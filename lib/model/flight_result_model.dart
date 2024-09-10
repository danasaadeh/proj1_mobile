class flightInfoRes {
  final String nyc, ldn, date, depature, number, time;
  final String departureTime;
  final String arrivalTime;
  final DateTime allDate;
  final String imagePath;
 

  flightInfoRes(  {
    required this.nyc,
    required this.time,
    required this.ldn,
    required this.date,
    required this.depature,
    required this.number,
     required this.allDate,
    required this.imagePath,
    required this.departureTime,
    required this.arrivalTime,

   
  });
}

final List<flightInfoRes> FlightsRes = [
  flightInfoRes(
      nyc: "New-York",
      ldn: "london",
      time: "8H 30M",
      date: "1 May",
      depature: "8:00 AM",
      number: "23", 
      allDate: DateTime(2023, 12, 25), 
      imagePath: 'lib/images/photo_2024-05-14_13-19-44.jpg',
     departureTime: '8:00 Am',
    arrivalTime: '4:00 Pm',
      
      ),
  flightInfoRes(
      nyc: "Dilhi",
      ldn: "Paris",
      time: "10H 30M",
      date: "3 March",
      depature: "6:00 AM",
      number: "24",
       allDate:DateTime(2024, 1, 10), 
      imagePath: 'lib/images/photo_2024-05-14_13-19-04.jpg',
      departureTime: '6:00 Am', 
      arrivalTime: '4:30 Pm',
      
      ),
  flightInfoRes(
      nyc: "Aleppo",
      ldn: "Tokyo",
      time: "6H 20M",
      date: "5 June",
      depature: "7:30 PM",
      number: "25",
       allDate:DateTime(2024, 10, 29) ,
       imagePath: 'lib/images/photo_2024-05-14_13-19-34.jpg',
       departureTime: '7:30 Pm', 
       arrivalTime: '1:25 Am',
     
      ),
  flightInfoRes(
      nyc: "london",
      ldn: "Roma",
      time: "10H",
      date: "1 May",
      depature: "10:00 AM",
      number: "26", 
      allDate:DateTime(2024, 5, 25),
      imagePath: 'lib/images/photo_2024-05-14_13-19-19.jpg',
      departureTime: '10:00 Am', 
      arrivalTime: '12:00 Pm',
     
      ),
];
