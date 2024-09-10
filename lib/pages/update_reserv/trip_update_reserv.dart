import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/reserv/show_details/cubit/trip_reserv_details_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv/update_reserv/cubit/update_trip_reserv_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv/update_reserv/cubit/update_trip_reserv_state.dart';
import 'package:tourism/model/trip_reserv_details.dart';
import 'package:tourism/pages/mybooking.dart';

class tripReserveDetails extends StatelessWidget {
  final int id;
  String? email;
  String? name;
  String? phone;
  String? bag;
  final TextEditingController controllerWalletPass = TextEditingController();
  List<String> bookedNames = ["Leen Ahmad", "Maram hasan"];

  List<bool> selectedNames = [true, false];

  tripReserveDetails({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TripReservDetailsCubit>(context).getTripReservDetails(id);
    return BlocBuilder<TripReservDetailsCubit, TripReservDetailsState>(
      builder: (context, state) {
        if (state is TripReservDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TripReservDetailsFailure) {
          return Center(
            child: Text('Failed to load TripReservDetailss'),
          );
        } else if (state is TripReservDetailsEmpty) {
          return Center(
            child: Text('No Trips TripReservDetailss available.'),
          );
        } else if (state is TripReservDetailsSuccess) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 70, left: 16, right: 16, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 650,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 241, 244, 244),
                            Color.fromARGB(255, 33, 71, 95),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            "Trip Name",
                            style: TextStyle(
                              color: Color(0XFF1B4158),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            state.tripReserv.tripName,
                            style: TextStyle(
                              // color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                              height: 0.1,
                              thickness: 1,
                              indent: 1,
                              endIndent: 1,
                              color: Colors.white),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trip Date",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Price",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.tripReserv.tripDate,
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                state.tripReserv.price,
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                              height: 0.1,
                              thickness: 1,
                              indent: 1,
                              endIndent: 1,
                              color: Colors.white),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Passenger ",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.tripReserv.passenger.length,
                              itemBuilder: (context, index) {
                                // return CheckboxListTile(
                                //   contentPadding: EdgeInsets
                                //       .zero, // تقليل المسافة بين العناصر
                                //   dense: true, // تصغير حجم خانة الاختيار
                                //   hoverColor: Color.fromARGB(255, 51, 86, 116),
                                //   activeColor: Color.fromARGB(255, 51, 86, 116),
                                //   checkColor: Colors.white,
                                //   title:
                                return Text(
                                  state.tripReserv.passenger[index].givenName +
                                      " " +
                                      state
                                          .tripReserv.passenger[index].lastName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                                //   value: selectedNames[index],
                                //   onChanged: (value) {
                                //     // setState(() {
                                //     //   selectedNames[index] = value!;
                                //     // });
                                //   },
                                // );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                              height: 0.1,
                              thickness: 1,
                              indent: 1,
                              endIndent: 1,
                              color: Colors.white),
                          SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Contact Name ",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.tripReserv.reservationDetails.contactName,
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Color(0XFF1B4158)),
                              suffixIcon:
                                  Icon(Icons.edit, color: Color(0XFF1B4158)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Phone number",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.tripReserv.reservationDetails.phoneNumber,
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              phone = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.phone, color: Color(0XFF1B4158)),
                              suffixIcon:
                                  Icon(Icons.edit, color: Color(0XFF1B4158)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            initialValue:
                                state.tripReserv.reservationDetails.email,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.email, color: Color(0XFF1B4158)),
                              suffixIcon:
                                  Icon(Icons.edit, color: Color(0XFF1B4158)),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            "lib/images/barcode.png",
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: BlocConsumer<UpdateTripReservCubit,
                          UpdateTripReservState>(
                        listener: (context, state2) {
                          if (state2 is UpdateTripReservSuccess) {
                            // Handle success state
                            //   Navigator.pop(context);
                            // Navigator.pushNamed(
                            //     context, RoomBooking.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state2.message),
                              ),
                            );
                            Navigator.pushNamed(context, MyBooking.id);
                          } else if (state2 is UpdateTripReservFailure) {
                            // Handle failure state
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state2.message),
                              ),
                            );
                          }
                        },
                        builder: (context, state2) {
                          if (state2 is UpdateTripReservLoading) {
                            // Show a loading indicator
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 51, 86, 116),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: const Text(
                                      "Enter your wallet password",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0XFF1B4158),
                                      ),
                                    ),
                                    content: TextField(
                                      controller: controllerWalletPass,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "cancel",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          BlocProvider.of<UpdateTripReservCubit>(context)
                                              .updateReserveTrip(
                                                  passengers: formatPassengers(
                                                      state.tripReserv
                                                          .passenger),
                                                  phoneNumber: phone == null
                                                      ? state
                                                          .tripReserv
                                                          .reservationDetails
                                                          .phoneNumber
                                                      : phone!,
                                                  contactName: name == null
                                                      ? state
                                                          .tripReserv
                                                          .reservationDetails
                                                          .contactName
                                                      : name!,
                                                  walletPassword:
                                                      controllerWalletPass.text,
                                                  email: email == null
                                                      ? state
                                                          .tripReserv
                                                          .reservationDetails
                                                          .email
                                                      : email!,
                                                  id: id);
                                        },
                                        child: const Text(
                                          "confirm",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0XFF1B4158),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Modify',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

List<Map<String, String>> formatPassengers(List<Passenger> passengers) {
  return passengers.map((passenger) {
    return {
      "given_name": passenger.givenName,
    };
  }).toList();
}
