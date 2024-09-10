// import 'package:flutter/material.dart';
// import 'package:tourism/model/flight_model.dart';
// import 'package:tourism/widget/customflight.dart';

// class ResultFlight extends StatelessWidget {
//   static String id = "reultflight";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Flights",
//           style: TextStyle(color: Color(0XFF1B4158)),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             Material(
//               elevation: 5,
//               borderRadius: BorderRadius.circular(100),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(100)),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             hintText: "Search",
//                             prefixIcon: Icon(Icons.search),
//                             enabledBorder: InputBorder.none,
//                             focusedBorder: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       const CircleAvatar(
//                           radius: 19,
//                           backgroundColor: Color(0XFF2C516C),
//                           child: Icon(Icons.filter_list, color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Let your dreams take flight!",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//                 child: ListView.builder(
//                     itemCount: Flights.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Column(children: [
//                         FlightCard(
//                             flightinfo: flightInfo(
//                                 nyc: Flights[index].nyc,
//                                 time: Flights[index].time,
//                                 ldn: Flights[index].ldn,
//                                 date: Flights[index].date,
//                                 depature: Flights[index].depature,
//                                 number: Flights[index].number),
//                             press: () {},
//                             width: double.infinity),
//                         SizedBox(
//                           height: 10,
//                         )
//                       ]);
//                     }))
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tourism/model/flight_custom_model.dart';
import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/search_flight_model.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/flights.dart';
import 'package:tourism/widget/customflight.dart';
import 'package:tourism/widget/customscaffold.dart';

class ResultFlight extends StatelessWidget {
  static String id = "reultflight";
  // final flightInfoRes flightinfores;
  final List<AvailableFlight> data;
  const ResultFlight({super.key, required this.data});

  @override
  Widget build(BuildContext context) => CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 400),
                        child: Container(
                            height: 0.1,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.navigate_before,
                                  size: 45,
                                  color: Color(0XFF1B4158),
                                ))),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text("  Flights.. ",
                                style: TextStyle(
                                    color: Color(0XFF1B4158),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CircleAvatar(
                              radius: 28,
                              backgroundColor:
                                  Color.fromARGB(255, 202, 206, 207),
                              child: Icon(
                                Icons.filter_list,
                                size: 35,
                                color: Color(0XFF1B4158),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 500,
                                width: double.infinity,
                                child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(children: [
                                        FlightCard(
                                            data: data[index],
                                            // flightinfo: flightInfo(
                                            //     nyc: FlightsRes[index].nyc,
                                            //     time: FlightsRes[index].time,
                                            //     ldn: FlightsRes[index].ldn,
                                            //     date: FlightsRes[index].date,
                                            //     depature:
                                            //         FlightsRes[index].depature,
                                            //     number:
                                            //         FlightsRes[index].number),
                                            press: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return DetailsFlight(
                                                      flightId: data[index]
                                                          .flightTimeId);
                                                },
                                              ));
                                              // Navigator.pushNamed(
                                              //   context,
                                              //   DetailsFlight.id,
                                              //   arguments: FlightsDet[index],
                                              // );
                                            },
                                            width: double.infinity),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ]);
                                    }),
                              )
                            ],
                          ),
                        ),
                      )
                    ]))),
      );
}
