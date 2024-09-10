import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/flights/reserv_flight/cubit/reserv_flight_cubit.dart';
import 'package:tourism/Features/flights/reserv_flight/cubit/reserv_flight_state.dart';

import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/model/flight_details.dart';

import 'package:tourism/model/payment_flight_model.dart';
import 'package:tourism/model/weight.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/personal_Info.dart';

import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/widget/customscaffold.dart';

class Payment_Flight extends StatelessWidget {
  // static String id = "paymentflight";
  final FlightDetails flightData;
  final TextEditingController _controllerWalletPass = TextEditingController();
  final List<Map<String, String>> passenger;
  final String phoneNumber;
  final String email;
  final String contactName;
  final String checkedBag_num;
  final int id;

  Payment_Flight({
    super.key,
    required this.flightData,
    required this.passenger,
    required this.phoneNumber,
    required this.email,
    required this.contactName,
    required this.checkedBag_num,
    required this.id,

    //  required PaymentFlight paymentflight,
  });
  List<Weight>? weight = [
    Weight(id: 4, name: '92'),
    Weight(id: 5, name: '115'),
    Weight(id: 6, name: '138'),
    Weight(id: 7, name: '161'),
    Weight(id: 8, name: '200'),
  ];

  @override
  Widget build(BuildContext context) {
    // int index = 1;
    // for (int i = 0; i <= 4; i++) {
    //   weight![i].id = int.parse(checkedBag_num);
    //   index = weight![i].id;
    // }
    // PaymentFlight paymentflight = PaymentFlight(
    //     nyc: 'Syria',
    //     time: '3H 30M',
    //     ldn: 'Egypt',
    //     date: '1/7/2024',
    //     price: '250',
    //     number: '23');
    // BaggageInfo baggageInfo =
    //     BaggageInfo(newPrice: '990.10', newWeight: '161', weight: '* 4');
    return CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(right: 245),
                          child: Text(" Payment:",
                              style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                Container(
                                    height: 229,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: const [
                                              Color(0XFF2C516C),
                                              Color.fromARGB(255, 202, 206, 207)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: const [0.5, 0.5]),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "From-city",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Transform.rotate(
                                                angle: -30,
                                                child: Icon(
                                                  Icons.flight,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text("To-city",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                flightData.fromCity.cityName,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(flightData.time,
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              Text(flightData.toCity.cityName,
                                                  style: TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 14,
                                          ),
                                          Text(
                                            "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                flightData.date,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                              Text(flightData.number,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16)),
                                              Text(
                                                  flightData.price.toString() +
                                                      '\$',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16))
                                            ],
                                          ),
                                          const Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Date",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text("Number",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Total price",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold))
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
                                              color: Colors.white),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "New weight",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  SizedBox(
                                                    width: 170,
                                                  ),
                                                  Text(
                                                    "New price",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(checkedBag_num,
                                                      //weight![index].name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    'kg Total',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0XFF1B4158)),
                                                  ),
                                                  SizedBox(
                                                    width: 170,
                                                  ),
                                                  Text(
                                                      (flightData.price * 2)
                                                              .toString() +
                                                          '\$',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    Icons.price_check_rounded,
                                                    color: Color(0XFF1B4158),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
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
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: BlocConsumer<ReservFlightCubit,
                              ReservFlightState>(
                            listener: (context, state) {
                              if (state is ReservFlightSuccess) {
                                // Handle success state
                                //   Navigator.pop(context);
                                // Navigator.pushNamed(
                                //     context, RoomBooking.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                  ),
                                );
                                Navigator.pushNamed(context, Success.id);
                              } else if (state is ReservFlightFailure) {
                                // Handle failure state
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(state.message),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is ReservFlightLoading) {
                                // Show a loading indicator
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: TextFormField(
                                        controller: _controllerWalletPass,
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 0.9999),
                                            ),
                                            hintText: "Wallet Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                            prefixIcon: Icon(
                                              Icons.sim_card_rounded,
                                              color: Color(0XFF1B4158),
                                            )),
                                        keyboardType: TextInputType.text,
                                        // inputFormatters: [
                                        //   FilteringTextInputFormatter.digitsOnly
                                        // ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0.01,
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
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor:
                                                  Color(0XFF1B4158),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20)),
                                          onPressed: () {
                                            BlocProvider.of<ReservFlightCubit>(
                                                    context)
                                                .reservFlight(
                                                    passengers: passenger,
                                                    phoneNumber: phoneNumber,
                                                    contactName: contactName,
                                                    walletPassword:
                                                        _controllerWalletPass
                                                            .text,
                                                    checkedBag_num:
                                                        checkedBag_num,
                                                    email: email,
                                                    id: id);
                                            // Navigator.pushReplacementNamed(
                                            //     context, Success.id);
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
                                                      BorderRadius.circular(
                                                          20)),
                                              backgroundColor: Color.fromARGB(
                                                  255, 237, 236, 236),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 20)),
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                //  return tripBooking(idPass: state.add_pass.id);
                                                return DetailsFlight(
                                                  flightId: id,
                                                );
                                              },
                                            ));
                                            // Navigator.pushReplacementNamed(
                                            //     context, DetailsFlight.id);
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
                                ],
                              );
                            },
                          ),
                        ),
                      ]),
                ))));
  }
}

List<Map<String, String>> formatPassengers(List<AddPassenger> passengers) {
  return passengers.map((passenger) {
    return {
      "given_name": passenger.givenName,
    };
  }).toList();
}
