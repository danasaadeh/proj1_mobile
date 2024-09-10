import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/flights/review/cubit/flight_review_cubit.dart';
import 'package:tourism/Features/flights/review/cubit/flight_review_state.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_cubit.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_state.dart';
import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/flight_custom_model.dart';

import 'package:tourism/pages/personal_Info.dart';

import 'package:tourism/pages/resultflight.dart';

import 'package:tourism/widget/customscaffold.dart';

class DetailsFlight extends StatelessWidget {
  static String id = "detailsflight";
  //flightInfoDet flightinfodet;
  final int flightId;

  DetailsFlight({super.key, required this.flightId});

  TimeOfDay? _selectedTime;

  // Future<void> _selectTime(BuildContext context) async {
  DateTime? startDate;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowFlightDetailsCubit>(context).getFlightDetails(flightId);
    BlocProvider.of<FlightReviewCubit>(context).fetchreview(flightId);
    // flightInfoDet flightinfodet =
    //     ModalRoute.of(context)!.settings.arguments as flightInfoDet;
    // if (flightinfodet == null) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('No result'),
    //     ),
    //   );
    // }

    return CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0.01),
                child:
                    BlocBuilder<ShowFlightDetailsCubit, ShowFlightDetailsState>(
                  builder: (context, state) {
                    if (state is ShowFlightDetailsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ShowFlightDetailsFailure) {
                      return Center(
                          child: Container(
                        child: Text(state.message.toString()),
                      ));
                    }
                    if (state is ShowFlightDetailsEmpty) {
                      return Center(
                          child: Container(
                        child: Text('Empty'),
                      ));
                    }
                    if (state is ShowFlightDetailsSuccess) {
                      return SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 60,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(right: 200),
                                child: Text(" Flight Details.. ",
                                    style: TextStyle(
                                        color: Color(0XFF1B4158),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13),
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 400,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 51, 86, 116),
                                        borderRadius:
                                            BorderRadius.circular(35)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text(
                                              "From-city",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Transform.rotate(
                                              angle: -30,
                                              child: const Icon(
                                                Icons.flight,
                                                color: Colors.grey,
                                                size: 34,
                                              ),
                                            ),
                                            Text("To-city",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 0.1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              state.flightDetails.fromCity
                                                  .cityName,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 236, 236),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              state.flightDetails.toCity
                                                  .cityName,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 236, 236),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "     Number",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text("Time        ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Text(
                                              state.flightDetails.number,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 236, 236),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 240,
                                            ),
                                            Text(
                                              state.flightDetails.time,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 236, 236),
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Divider(
                                          color: Colors.grey,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.cases_rounded,
                                                      size: 35,
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Carry_on Baggage",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(Icons.cases_rounded,
                                                      size: 35,
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  RichText(
                                                      text: TextSpan(
                                                          children: <TextSpan>[
                                                        TextSpan(
                                                          text:
                                                              "Checked Baggage \n \n",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: state
                                                              .flightDetails
                                                              .carryOnBaggage[0],
                                                          //"Included: 1*23 kg/person",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    237,
                                                                    236,
                                                                    236),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        )
                                                      ])),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Divider(
                                          color: Colors.grey,
                                          indent: 15,
                                          endIndent: 15,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 140,
                                            ),
                                            Text("Price",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              state.flightDetails.price
                                                  .toString(),
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 236, 236),
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 1,
                                            ),
                                            Icon(Icons.price_check_rounded,
                                                size: 30, color: Colors.white),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 75,
                                  width: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color(0XFF2C516C),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            //  return tripBooking(idPass: state.add_pass.id);
                                            return Personal_Info(
                                              flightId: flightId,
                                              flightData: state.flightDetails,
                                              data: AddPassenger(
                                                  givenName: '',
                                                  lastName: '',
                                                  dateOfBirth: '',
                                                  city:
                                                      City(id: 0, cityName: ''),
                                                  id: 0),
                                            );
                                          },
                                        ));
                                        // Navigator.pushReplacementNamed(
                                        //     context, Personal_Info.id);
                                      },
                                      child: const Text(
                                        "Confirm",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 75,
                                  width: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color.fromARGB(
                                              255, 237, 236, 236),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, ResultFlight.id);
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Color(0XFF1B4158),
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(right: 300),
                                child: Text(
                                  "Reviews:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0XFF1B4158)),
                                ),
                              ),
                              BlocBuilder<FlightReviewCubit, FlightReviewState>(
                                builder: (context, state2) {
                                  if (state2 is FlightReviewInitial ||
                                      state2 is FlightReviewLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (state2 is FlightReviewEmpty) {
                                    return Column(
                                      children: [
                                        const Center(
                                          child: Text(
                                            'There are no flight reviews yet, be the first one who give us a nice review',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: commentController,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: const Icon(Icons.send,
                                                  color: Color(0XFF2C516C)),
                                              onPressed: () {
                                                BlocProvider.of<
                                                            FlightReviewCubit>(
                                                        context)
                                                    .addFlightReview(
                                                  flightId,
                                                  commentController.text!,
                                                );
                                                BlocProvider.of<
                                                            FlightReviewCubit>(
                                                        context)
                                                    .fetchreview(flightId);

                                                commentController.clear();
                                              },
                                            ),
                                            prefixIcon: const Icon(
                                                Icons.comment,
                                                color: Color.fromARGB(
                                                    255, 201, 198, 198)),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            hintText: 'Add Your Comment',
                                            hintStyle:
                                                const TextStyle(fontSize: 12),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (state2 is FlightReviewSuccess) {
                                    final reviews = state2.review;
                                    if (reviews.isEmpty) {
                                      return Column(
                                        children: [
                                          const Center(
                                            child: Text(
                                              'There are no flights reviews yet, be the first one who give us a nice review',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            controller: commentController,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                icon: const Icon(Icons.send,
                                                    color: Color(0XFF2C516C)),
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              FlightReviewCubit>(
                                                          context)
                                                      .addFlightReview(
                                                    flightId,
                                                    commentController.text!,
                                                  );
                                                  BlocProvider.of<
                                                              FlightReviewCubit>(
                                                          context)
                                                      .fetchreview(flightId);

                                                  commentController.clear();
                                                },
                                              ),
                                              prefixIcon: const Icon(
                                                  Icons.comment,
                                                  color: Color.fromARGB(
                                                      255, 201, 198, 198)),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0XFF1B4158),
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              hintText: 'Add Your Comment',
                                              hintStyle:
                                                  const TextStyle(fontSize: 12),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Color(0XFF1B4158),
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    return Column(children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: reviews.length,
                                        itemBuilder: (context, index) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      const Color(0XFF2C516C)
                                                          .withOpacity(0.9),
                                                  child: const Icon(
                                                      Icons.person,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0.1),
                                                  height: 70,
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.3),
                                                    color: const Color.fromARGB(
                                                        255, 233, 233, 233),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                  child: ListTile(
                                                    title: Text(
                                                      reviews[index].userName,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0XFF1B4158)),
                                                    ),
                                                    subtitle: Text(
                                                        reviews[index].review,
                                                        style: const TextStyle(
                                                            fontSize: 12)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                      TextFormField(
                                        controller: commentController,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: const Icon(Icons.send,
                                                color: Color(0XFF2C516C)),
                                            onPressed: () {
                                              BlocProvider.of<
                                                          FlightReviewCubit>(
                                                      context)
                                                  .addFlightReview(
                                                flightId,
                                                commentController.text!,
                                              );
                                              BlocProvider.of<
                                                          FlightReviewCubit>(
                                                      context)
                                                  .fetchreview(flightId);

                                              commentController.clear();
                                            },
                                          ),
                                          hintText: 'Add Your Comment',
                                          hintStyle:
                                              const TextStyle(fontSize: 12),
                                          prefixIcon: const Icon(Icons.comment,
                                              color: Color.fromARGB(
                                                  255, 201, 198, 198)),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ]);
                                  } else if (state2 is FlightReviewFailure) {
                                    // Error state, display an error message
                                    return Center(child: Text('failureeee'));
                                  } else {
                                    // State when there are no reviews available
                                    return const Center(
                                        child: Text('No reviews available'));
                                  }
                                },
                              ),
                              /*ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                //flightinfodet.review.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Color(0XFF2C516C)
                                              .withOpacity(0.9),
                                          child: Icon(Icons.person,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(0.1),
                                          height: 70,
                                          width: 250,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.3),
                                              color: Color.fromARGB(
                                                  255, 233, 233, 233),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: ListTile(
                                            title: Text(
                                              "nameeee"
                                              // flightinfodet.review[index]['name']!
                                              ,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0XFF1B4158)),
                                            ),
                                            subtitle: Text(
                                                "commment"
                                                // flightinfodet.review[index]['comment']!
                                                ,
                                                style: TextStyle(fontSize: 12)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Add Comment",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(Icons.send,
                                      color: Color(0XFF2C516C)),
                                  prefixIcon: Icon(Icons.comment,
                                      color:
                                          Color.fromARGB(255, 201, 198, 198)),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0XFF1B4158),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0XFF1B4158),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),*/
                            ]),
                      );
                    } else {
                      return Center(
                        child: Text("Something went wrong please try again"),
                      );
                    }
                  },
                ))));
  }
}
