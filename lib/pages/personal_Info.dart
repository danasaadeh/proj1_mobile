import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/Features/flights/passenger/add/cubit/add_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/delete/cubit/delete_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/delete/cubit/delete_flight_passenger_state.dart';
import 'package:tourism/Features/flights/passenger/show_all/cubit/show_all_flight_passenegers_cubit.dart';
import 'package:tourism/Features/flights/passenger/show_all/cubit/show_all_flight_passenegers_state.dart';

import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/model/flight_details.dart';

import 'package:tourism/model/weight.dart';
import 'package:tourism/pages/addPassenger.dart';

import 'package:tourism/pages/payment_flight.dart';
import 'package:tourism/pages/update_flight_passenger.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:tourism/widget/weight_drop_down.dart';

class Personal_Info extends StatelessWidget {
  static String id = "personalinfo";

  final _formKey = GlobalKey<FormState>();
  final AddPassenger data;
  final int flightId;
  // بيانات الحجز
  String? Contact_Name;

  String? Phone_Number;

  String? _email;

  int _passengersCount = 0;

  // List<PassengerData> _passengers = [];

  String? selectedWeight;

  DateTime? startDate;
  final FlightDetails flightData;
  List<Weight>? weight = [
    Weight(id: 4, name: '92'),
    Weight(id: 5, name: '115'),
    Weight(id: 6, name: '138'),
    Weight(id: 7, name: '161'),
    Weight(id: 8, name: '200'),
  ];
  final TextEditingController _controllerPhoneNum = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerWalletPass = TextEditingController();

  Personal_Info(
      {super.key,
      required this.data,
      required this.flightId,
      required this.flightData});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowAllFlightPassengersCubit>(context).getAllPassengers();
    return CustomScaffold(
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
                    "Enter Info..",
                    style: TextStyle(
                      color: Color(0XFF1B4158),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<ShowAllFlightPassengersCubit,
                            ShowAllFlightPassengersState>(
                          builder: (context, state) {
                            if (state is ShowAllFlightPassengersLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is ShowAllFlightPassengersEmpty) {
                              return Center(
                                child: Text(
                                  'There is no Passengers! please add a passenger',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else if (state
                                is ShowAllFlightPassengersFailure) {
                              return Container(
                                child: Text("error"),
                              );
                            } else if (state
                                is ShowAllFlightPassengersSuccess) {
                              return Column(
                                children: [
                                  for (int i = 0; i < state.pass.length; i++)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //final passengers= formatPassengers(state.pass);
                                        Container(
                                          child: Text(
                                            state.pass[i].givenName +
                                                " " +
                                                state.pass[i].lastName,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // BlocProvider.of<EditPassengerCubit>(
                                                //         context)
                                                //     .getFilters();
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return UpdateFlightPassenger(
                                                      data: state.pass[i]);
                                                }

                                                        // passengersCount:
                                                        //     _passengersCount,
                                                        // onPassengerAdded:
                                                        //     (passengerData) {
                                                        //   //  setState(() {
                                                        //   _passengers
                                                        //       .add(passengerData);
                                                        //   _passengersCount++;
                                                        // });

                                                        ));
                                                // Navigator.pushNamed(
                                                //     context, tripaddPassenger.id);
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                size: 20,
                                                color: Color(0XFF1B4158),
                                              ),
                                            ),
                                            BlocConsumer<
                                                DeleteFlightPassengerCubit,
                                                DeleteFlightPassengerState>(
                                              listener: (context, state2) {
                                                if (state2
                                                    is DeleteFlightPassengerSuccess) {
                                                  // Handle success state
                                                  //   Navigator.pop(context);
                                                  // Navigator.pushNamed(
                                                  //     context, RoomBooking.id);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(state2.message),
                                                    ),
                                                  );
                                                } else if (state2
                                                    is DeleteFlightPassengerFailure) {
                                                  // Handle failure state
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content:
                                                          Text(state2.message),
                                                    ),
                                                  );
                                                }
                                              },
                                              builder: (context, state2) {
                                                if (state2
                                                    is DeleteFlightPassengerLoading) {
                                                  // Show a loading indicator
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                                return IconButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                DeleteFlightPassengerCubit>(
                                                            context)
                                                        .DeleteFlightPassenger(
                                                            state.pass[i].id,
                                                            context: context);
                                                    // BlocProvider.of<
                                                    //             ShowAllFlightPassengersCubit>(
                                                    //         context)
                                                    //     .getAllPassengers();
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 20,
                                                    color: Color(0XFF1B4158),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              );
                              /*return Row(
                          children: [
                            for (int i = 0; i < state.pass.length; i++)
                              Container(
                                child: Text(
                                  state.pass[i].givenName +
                                      "  " +
                                      state.pass[i].lastName,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            SizedBox(
                              width: 120,
                            ),
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<AddPassengerCubit>(context)
                                    .getFilters();
                                Navigator.pushNamed(
                                    context, tripaddPassenger.id);
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                for (int i = 0; i < state.pass.length; i++)
                                  BlocProvider.of<DeleteFlightPassengerCubit>(context)
                                      .DeleteFlightPassenger(state.pass[i].id);
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                          ],
                        );*/
                            } else {
                              return Container(
                                child: Text('Something went wrong'),
                              );
                            }
                          },
                        ),

                        /* Row(
                        children: [
                          Container(
                            child: Text(
                              data!.givenName + "  " + data!.lastName,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AddFlightPassengerCubit>(context)
                                  .getFilters();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPassengersScreen(
                                    flightId: flightId,
                                    passengersCount: _passengersCount,
                                    onPassengerAdded: (passengerData) {
                                      //    setState(() {
                                      _passengers.add(passengerData);
                                      _passengersCount++;
                                      // });
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 20,
                              color: Color(0XFF1B4158),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<DeleteFlightPassengerCubit>(
                                      context)
                                  .DeleteFlightPassenger(data!.id);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 20,
                              color: Color(0XFF1B4158),
                            ),
                          ),
                        ],
                      ),*/
                        /*if (_passengers.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  children: [
                                    Text(
                                      '${_passengers[0].name} ',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${_passengers[0].lastname} ',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  // Checkbox(
                                  //   focusColor: Colors.black,
                                  //   hoverColor:
                                  //       Color.fromARGB(255, 51, 86, 116),
                                  //   activeColor:
                                  //       Color.fromARGB(255, 51, 86, 116),
                                  //   checkColor: Colors.white,
                                  //   value: _passengers[0].isChecked,
                                  //   onChanged: (value) {
                                  //     setState(() {
                                  //       _passengers[0].isChecked = value!;
                                  //     });
                                  //   },
                                  // ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, AddPassengersScreen.id);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),*/
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, right: 70, left: 70),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 51, 86, 116),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddPassengersScreen(
                                      flightId: flightId,
                                      passengersCount: _passengersCount,
                                      onPassengerAdded: (passengerData) {
                                        //    setState(() {
                                        // _passengers.add(passengerData);
                                        _passengersCount++;
                                        // });
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.add_circle_outlined,
                                      size: 22, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Add Passenger',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 35),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 200),
                                child: Text(
                                  'Contact',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _controllerName,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter your name';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      Contact_Name = value;
                                    },
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 0.9999),
                                        ),
                                        hintText: "Contact Name",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                        prefixIcon: Icon(
                                          Icons.person_2,
                                          color: Color(0XFF1B4158),
                                        )),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _controllerPhoneNum,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter your Phone Number';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      Phone_Number = value;
                                    },
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color: Color(0XFF1B4158),
                                            width: 0.9999),
                                      ),
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                      prefixIcon: Icon(
                                        Icons.numbers_outlined,
                                        color: Color(0XFF1B4158),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextFormField(
                                    controller: _controllerEmail,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter your Email';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _email = value;
                                    },
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          borderSide: BorderSide(
                                              color: Color(0XFF1B4158),
                                              width: 0.9999),
                                        ),
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color(0XFF1B4158),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(height: 28),
                              Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 200),
                                  child: Text(
                                    'Add Baggage',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cases_rounded,
                                      size: 25,
                                      color: Color(0XFF1B4158),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Carry_on Baggage",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 73, 72, 72),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cases_rounded,
                                      size: 25,
                                      color: Color(0XFF1B4158),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                            text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                            text: "Checked Baggage \n ",
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 73, 72, 72),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 100,
                                          child: WeightDropDown(
                                            onChanged: (value) {
                                              selectedWeight = value;
                                            },
                                            hint: 'Weight',
                                            isdropSelected: true,
                                            dataList: weight,
                                            selectedValue: selectedWeight,
                                          ),
                                        ),
                                        /* ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 51, 86, 116),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1, vertical: 5),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                        onPressed: () {
                                          showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            80))),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: ListView.builder(
                                                    itemCount: bag.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final bagge = bag[index];

                                                      return Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 185,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .cases_rounded,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          51,
                                                                          86,
                                                                          116),
                                                                ),
                                                                Text(
                                                                  bagge.weight,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          19),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 185,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(bagge
                                                                    .newWeight),
                                                                Text(
                                                                  'kg Total',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 185,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(bagge
                                                                    .newPrice),
                                                                Icon(
                                                                  Icons
                                                                      .price_check_rounded,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          51,
                                                                          86,
                                                                          116),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 7,
                                                          ),
                                                          Divider(
                                                            height: 5,
                                                            thickness: 5,
                                                            indent: 1,
                                                            endIndent: 1,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    208,
                                                                    207,
                                                                    207),
                                                          ),
                                                        ],
                                                      );
                                                    }),
                                              );
                                            },
                                          );
                                        },
                                        child: const Text(
                                          'Add',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                      ),*/
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                              SizedBox(height: 20),
                              BlocBuilder<ShowAllFlightPassengersCubit,
                                  ShowAllFlightPassengersState>(
                                builder: (context, state) {
                                  if (state is ShowAllFlightPassengersSuccess) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 51, 86, 116),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35, vertical: 10),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          print(selectedWeight);
                                          print(flightId);
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              //  return tripBooking(idPass: state.add_pass.id);
                                              return Payment_Flight(
                                                  flightData: flightData,
                                                  phoneNumber:
                                                      _controllerPhoneNum.text,
                                                  passenger: formatPassengers(
                                                      state.pass),
                                                  email: _controllerEmail.text,
                                                  contactName:
                                                      _controllerName.text,
                                                  checkedBag_num:
                                                      selectedWeight!,
                                                  id: flightId);
                                            },
                                          ));

                                          // Navigator.pushReplacementNamed(
                                          //     context, Payment_Flight.id);
                                        }
                                      },
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white),
                                      ),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

class BaggageInfo {
  final String weight;
  final String newWeight;
  final String newPrice;

  BaggageInfo(
      {required this.weight, required this.newWeight, required this.newPrice});
}

List<BaggageInfo> bag = [
  BaggageInfo(
    newPrice: '459.10',
    weight: ' * 4',
    newWeight: '92 ',
  ),
  BaggageInfo(
    newPrice: '599.10',
    weight: ' * 5',
    newWeight: '115 ',
  ),
  BaggageInfo(
    newPrice: '739.10',
    weight: ' * 6',
    newWeight: '138 ',
  ),
  BaggageInfo(
    newPrice: '879.10',
    weight: ' * 7',
    newWeight: '161 ',
  ),
  BaggageInfo(
    newPrice: '990.10',
    weight: ' * 8',
    newWeight: '200 ',
  )
];

List<Map<String, String>> formatPassengers(List<AddPassenger> passengers) {
  return passengers.map((passenger) {
    return {
      "given_name": passenger.givenName,
    };
  }).toList();
}
