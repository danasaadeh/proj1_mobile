// ignore_for_file: file_names

import 'package:flutter/material.dart';


class RoomBooking extends StatelessWidget {
  static String id = "roombooking";

  const RoomBooking({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Center(
            child: Image.asset(
              "lib/images/photo_2024-07-14_05-59-08.jpg",
              height: 250,
              width: 400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Success!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Your room has been successfully booked. ",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "We hope you enjoy your stay to the fullest!",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 50,
            width: 210,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0XFF1B4158),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
              child: const Text(
                'Done',
                style:  TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
