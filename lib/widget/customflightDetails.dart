// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/model/flight_custom_model.dart';
import 'package:tourism/pages/forgotpass.dart';


class FlightCardDetails extends StatelessWidget {

  final flightInfo flightinfo;
  final VoidCallback press;
  final double width;

  const FlightCardDetails(
      {super.key,
      required this.flightinfo,
      required this.press,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Container(
                height: 300,
                width: width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: const [
                          Color(0XFF2C516C),
                          Color.fromARGB(255, 202, 206, 207)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.5, 0.5]),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NYC",
                            style: TextStyle(color: Colors.white),
                          ),
                          Transform.rotate(
                            angle: -30,
                            child: Icon(
                              Icons.flight,
                              color: Colors.white,
                            ),
                          ),
                          Text("LDN", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            flightinfo.nyc,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(flightinfo.time,
                              style: TextStyle(color: Colors.white)),
                          Text(flightinfo.ldn,
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",style: TextStyle(color:Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            flightinfo.date,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(flightinfo.depature,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          Text(flightinfo.number,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            "Date",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("Depature time",
                              style: TextStyle(color: Colors.white)),
                          Text("Number", style: TextStyle(color: Colors.white))
                        ],
                      ),
                  SizedBox(height: 0.01,),
                  
                                              
                    ]))),
            Positioned(
                left: -5,
                bottom: 0,
                top: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                )),
            Positioned(
                top: 0,
                bottom: 0,
                right: -5,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
