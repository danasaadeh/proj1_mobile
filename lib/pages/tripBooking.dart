import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_state.dart';
import 'package:tourism/Features/cubit/Trips/deletepassenger/deletepassenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/deletepassenger/deletepassenger_state.dart';
import 'package:tourism/Features/cubit/Trips/editpassenger/editpassenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_state.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_cubit.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_state.dart';
import 'package:tourism/Features/cubit/Trips/show_passenger/cubit/show_passenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/show_passenger/cubit/show_passenger_state.dart';
import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/pages/tripaddPassenger.dart';
import 'package:tourism/pages/update_trip_pass.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class tripBooking extends StatelessWidget {
  static String id = "book";
  //final int idPass;
  final GlobalKey<FormState> keytrip = GlobalKey<FormState>();
  final TextEditingController _controllerPhoneNum = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerWalletPass = TextEditingController();
  int _passengersCount = 0;
  final AddPassenger data;
  final int tripId;
  final _formKey = GlobalKey<FormState>();
  // List<PassengerData> _passengers = [];

  tripBooking({super.key, required this.data, required this.tripId});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowAllPassengersCubit>(context).pass;
    BlocProvider.of<ShowAllPassengersCubit>(context).getAllPassengers();
    // BlocProvider.of<ShowPassengerCubit>(context).getTripPassenger(idPass);
    // int idPass = data!.id;
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 50, bottom: 15, right: 16),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Enter Your Info to Book",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF1B4158)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  BlocBuilder<ShowAllPassengersCubit, ShowAllPassengersState>(
                    builder: (context, state) {
                      if (state is ShowAllPassengersLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ShowAllPassengersEmpty) {
                        return const Center(
                          child: Text(
                            'There is no Passengers! please add a passenger',
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else if (state is ShowAllPassengersFailure) {
                        return Container(
                          child: const Text("error"),
                        );
                      } else if (state is ShowAllPassengersSuccess) {
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
                                      style: const TextStyle(fontSize: 16),
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
                                            return UpdateTripPassenger(
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
                                        icon: const Icon(
                                          Icons.edit,
                                          size: 20,
                                          color: Color(0XFF1B4158),
                                        ),
                                      ),
                                      BlocConsumer<DeletePassengerCubit,
                                          DeletePassengerState>(
                                        listener: (context, state2) {
                                          if (state2
                                              is DeletePassengerSuccess) {
                                            // Handle success state
                                            //   Navigator.pop(context);
                                            // Navigator.pushNamed(
                                            //     context, RoomBooking.id);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(state2.message),
                                              ),
                                            );
                                          } else if (state2
                                              is DeletePassengerFailure) {
                                            // Handle failure state
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(state2.message),
                                              ),
                                            );
                                          }
                                        },
                                        builder: (context, state2) {
                                          if (state2
                                              is DeletePassengerLoading) {
                                            // Show a loading indicator
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          return IconButton(
                                            onPressed: () {
                                              BlocProvider.of<
                                                          DeletePassengerCubit>(
                                                      context)
                                                  .deletePassenger(
                                                      state.pass[i].id,
                                                      context: context);
                                              // BlocProvider.of<
                                              //             ShowAllPassengersCubit>(
                                              //         context)
                                              //     .getAllPassengers();
                                            },
                                            icon: const Icon(
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
                                  BlocProvider.of<DeletepassengerCubit>(context)
                                      .deletePassenger(state.pass[i].id);
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
                          child: const Text('Something went wrong'),
                        );
                      }
                    },
                  ),

                  // BlocBuilder<ShowPassengerCubit, ShowPassengerState>(
                  //   builder: (context, state) {
                  //     if (state is ShowPassengerSuccess) {
                  //return
                  /*Row(
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
                          BlocProvider.of<AddPassengerCubit>(context)
                              .getFilters();
                          Navigator.pushNamed(context, tripaddPassenger.id);
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 20,
                          color: Color(0XFF1B4158),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<DeletepassengerCubit>(context)
                              .deletePassenger(data!.id);
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                          color: Color(0XFF1B4158),
                        ),
                      ),
                    ],
                  ),*/
                  //  }
                  //     if (state is ShowPassengerFailure) {
                  //       return Container(
                  //         child: Text("error"),
                  //       );
                  //     }
                  //     if (state is ShowPassengerLoading) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     return Container();
                  //   },
                  // ),
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
                              /*Checkbox(
                                focusColor: Colors.black,
                                hoverColor: Color.fromARGB(255, 51, 86, 116),
                                activeColor: Color.fromARGB(255, 51, 86, 116),
                                checkColor: Colors.white,
                                value: _passengers[0].isChecked,
                                onChanged: (value) {
                                  // setState(() {
                                  _passengers[0].isChecked = value!;
                                  // });
                                },
                              ),*/
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
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 20,
                  ),*/
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 51, 86, 116),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          BlocProvider.of<AddPassengerCubit>(context)
                              .getFilters();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tripaddPassenger(
                                tripId: tripId,
                                // passengersCount: _passengersCount,
                                // onPassengerAdded: (passengerData) {
                                //   //  setState(() {
                                //   // _passengers.add(passengerData);
                                //   // _passengersCount++;
                                //   // });
                                // },
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add_circle_outlined,
                                size: 22, color: Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add Passenger',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  BlocConsumer<ReservTripCubit, ReservTripState>(
                    listener: (context, state) {
                      if (state is ReservTripSuccess) {
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
                      } else if (state is ReservTripFailure) {
                        // Handle failure state
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ReservTripLoading) {
                        // Show a loading indicator
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Contact:",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              controller: _controllerName,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                labelText: "Full name:",
                                prefixIcon: Icon(Icons.person),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a  name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //name = value;
                              },
                            ),
                            // CustomTextField(
                            //   labelText: "Full Name",
                            //   prefixIcon: Icons.person,
                            //   validationMessage: "Please Enter Your Name",
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _controllerPhoneNum,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                labelText: "Phone Number",
                                prefixIcon: Icon(Icons.phone),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a phone num';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //  name = value;
                              },
                            ),
                            // CustomTextField(
                            //   labelText: "Phone Number",
                            //   prefixIcon: Icons.phone,
                            //   validationMessage: "Please Enter Your Number",
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _controllerEmail,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //name = value;
                              },
                            ),
                            // CustomTextField(
                            //   labelText: "Email",
                            //   prefixIcon: Icons.email,
                            //   validationMessage: "Please Enter Your Email",
                            // ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _controllerWalletPass,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                labelText: "Wallet Password",
                                prefixIcon: Icon(Icons.wallet),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0XFF1B4158),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a  name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                // name = value;
                              },
                            ),
                            // CustomTextField(
                            //   labelText: "Wallet password",
                            //   prefixIcon: Icons.wallet,
                            //   validationMessage:
                            //       "Please Enter Your Wallet password",
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: SizedBox(
                                height: 55,
                                width: 205,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: const Color.fromARGB(
                                              255, 51, 86, 116),
                                          title: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.info_outlined,
                                                color: Colors.white,
                                                size: 70,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                "The cost of your flight reservation is \$100. Half of the amount will be deducted when you press OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            BlocBuilder<ShowAllPassengersCubit,
                                                ShowAllPassengersState>(
                                              builder: (context, state) {
                                                if (state
                                                    is ShowAllPassengersSuccess)
                                                  return TextButton(
                                                    onPressed: () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _formKey.currentState!
                                                            .save();
                                                        BlocProvider.of<ReservTripCubit>(context).reserveTrip(
                                                            passengers:
                                                                formatPassengers(
                                                                    state.pass),
                                                            phoneNumber:
                                                                _controllerPhoneNum
                                                                    .text,
                                                            contactName:
                                                                _controllerName
                                                                    .text,
                                                            walletPassword:
                                                                _controllerWalletPass
                                                                    .text,
                                                            email:
                                                                _controllerEmail
                                                                    .text,
                                                            id: tripId);
                                                      }
                                                      print(tripId);
                                                      // Navigator.pushNamed(
                                                      //     context, Success.id);
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  );
                                                return Container();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      const Color.fromARGB(255, 51, 86, 116),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ]);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> formatPassengers(List<AddPassenger> passengers) {
  return passengers.map((passenger) {
    return {
      "given_name": passenger.givenName,
    };
  }).toList();
}
