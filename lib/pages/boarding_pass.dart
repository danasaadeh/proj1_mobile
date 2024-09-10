import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tourism/widget/customscaffold.dart';

class BoardingPass extends StatelessWidget {
  // static String id = "boardingPass";
  //flightPass? flightpass;

  BoardingPass({
    super.key,
    //required this.flightpass
  });

  @override
  Widget build(BuildContext context) => CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 220),
                  child: Text(
                    "Boarding Pass",
                    style: TextStyle(
                      color: Color(0XFF1B4158),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  ' Passenger Name: \n ',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('Ahmad Saleh',
                    //flightpass!.passengers_name,
                    style: TextStyle(color: Color(0XFF1B4158), fontSize: 14)),
                SizedBox(
                  height: 13,
                ),
                Divider(
                    height: 1,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0XFF1B4158)),
                SizedBox(
                  height: 13,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'NYC',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('LDN',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Paris',
                          //flightpass!.nyc,
                          style: TextStyle(
                              color: Color(0XFF1B4158),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Text('LOndon',
                            //flightpass!.ldn,
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Divider(
                    height: 1,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0XFF1B4158)),
                SizedBox(
                  height: 13,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('Time',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2024-3-4',
                          // flightpass!.date,
                          style: TextStyle(
                              color: Color(0XFF1B4158),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Text('5:00 Am',
                            // flightpass!.time,
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Divider(
                    height: 1,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0XFF1B4158)),
                SizedBox(
                  height: 13,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Number flight',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('Class',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '4',
                          //flightpass!.number,
                          style: TextStyle(
                              color: Color(0XFF1B4158),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Text('First Class',
                            //flightpass!.Class,
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset("lib/images/photo_2024-08-03_15-28-58.jpg"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'This reservation after:' + '2024-3-4'
                  // ${flightpass!.depature}
                  ,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 95, 9, 3)),
                ),
              ],
            ),
          ),
        )),
      );
}

class flightPass {
  final String nyc, ldn, date, depature, number, time, Class, passengers_name;

  flightPass(
      {required this.nyc,
      required this.time,
      required this.ldn,
      required this.date,
      required this.depature,
      required this.number,
      required this.Class,
      required this.passengers_name});
}

final List<flightPass> Flights = [
  flightPass(
      nyc: "New-York",
      ldn: "london",
      time: "8H 30M",
      date: "1 May",
      depature: "8:00 AM",
      number: "23",
      Class: 'Economy',
      passengers_name: 'Rama Ahmad'),
  flightPass(
      nyc: "Dilhi",
      ldn: "Paris",
      time: "10H 30M",
      date: "3 March",
      depature: "6:00 AM",
      number: "24",
      Class: 'Business',
      passengers_name: 'Sara Mohmad \n nour salama'),
  flightPass(
      nyc: "Aleppo",
      ldn: "Tokyo",
      time: "6H 20M",
      date: "5 June",
      depature: "7:30 PM",
      number: "25",
      Class: 'Economy',
      passengers_name: 'Anas Hussain'),
  flightPass(
      nyc: "london",
      ldn: "Roma",
      time: "10H",
      date: "1 May",
      depature: "10:00 AM",
      number: "26",
      Class: 'Business',
      passengers_name: 'Lana Samer'),
];
