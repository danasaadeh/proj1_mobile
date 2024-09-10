import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism/model/flight_custom_model.dart';
import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/search_flight_model.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/widget/customflight.dart';
import 'package:tourism/widget/customscaffold.dart';

class Round_way extends StatelessWidget {
  //final flightInfoRes flightinfores;
  static String id = "way";
  final List<AvailableFlight>? dataDepart;
  final List<AvailableFlight>? dataReturn;
  const Round_way({
    super.key,
    required this.dataDepart,
    required this.dataReturn,
    // required this.flightinfores
  });

  @override
  Widget build(BuildContext context) => CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 2),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Round Trip..",
                      style: TextStyle(
                          color: Color(0XFF1B4158),
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                            height: 30,
                            width: 290,
                            child: TabBar(
                                indicatorSize: TabBarIndicatorSize.label,
                                labelColor: Color.fromARGB(255, 21, 43, 56),
                                indicatorColor: Color(0XFF1B4158),
                                unselectedLabelColor:
                                    Color.fromARGB(255, 173, 174, 174),
                                dividerHeight: 1,
                                dividerColor:
                                    Color.fromARGB(255, 127, 128, 128),
                                tabs: const [
                                  Tab(
                                    child: Text(
                                      'Depart',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Return',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),
                                    ),
                                  ),
                                ])),
                      ),
                      SizedBox(
                          height: 500,
                          width: double.infinity,
                          child: TabBarView(children: [
                            SingleChildScrollView(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (dataDepart == null ||
                                        dataDepart!.isEmpty)
                                      const Text('No departure flights found.'),
                                    if (dataDepart != null &&
                                        dataDepart!.isNotEmpty)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 500,
                                            width: double.infinity,
                                            child: ListView.builder(
                                                itemCount: dataDepart!.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Column(children: [
                                                    FlightCard(
                                                        data:
                                                            dataDepart![index],
                                                        // date:
                                                        //     FlightsRes[index]
                                                        //         .date,
                                                        // depature:
                                                        //     FlightsRes[index]
                                                        //         .depature,
                                                        // number:
                                                        //     FlightsRes[index]
                                                        //         .number),
                                                        press: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                            builder: (context) {
                                                              return DetailsFlight(
                                                                  flightId: dataDepart![
                                                                          index]
                                                                      .flightTimeId);
                                                            },
                                                          ));
                                                          // Navigator.pushNamed(
                                                          //   context,
                                                          //   DetailsFlight.id,
                                                          //   arguments:
                                                          //       FlightsDet[index],
                                                          // );
                                                        },
                                                        width: double.infinity),
                                                    const SizedBox(
                                                      height: 5,
                                                    )
                                                  ]);
                                                }),
                                          )
                                        ],
                                      )
                                  ],
                                ),
                              )),
                            ),
                            SingleChildScrollView(
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (dataReturn == null ||
                                        dataReturn!.isEmpty)
                                      const Text('No departure flights found.'),
                                    if (dataReturn != null &&
                                        dataReturn!.isNotEmpty)
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 500,
                                            width: double.infinity,
                                            child: ListView.builder(
                                                itemCount: dataReturn!.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Column(children: [
                                                    FlightCard(
                                                        data:
                                                            dataReturn![index],
                                                        press: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                            builder: (context) {
                                                              return DetailsFlight(
                                                                  flightId: dataReturn![
                                                                          index]
                                                                      .flightTimeId);
                                                            },
                                                          ));
                                                          // Navigator.pushNamed(
                                                          //   context,
                                                          //   DetailsFlight.id,

                                                          //   // arguments:
                                                          //   //     FlightsDet[
                                                          //   //         index],
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
                                  ],
                                ),
                              )),
                            )
                          ]))
                    ],
                  ),
                )
              ]))));
}
