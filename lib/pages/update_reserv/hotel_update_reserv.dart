import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tourism/Features/hotels/hotel_reserv/show_details/cubit/hotel_reserv_details_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/update_reserv/cubit/update_hotel_reserv_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/update_reserv/cubit/update_hotel_reserv_state.dart';
import 'package:tourism/pages/mybooking.dart';
import 'package:tourism/widget/customscaffold.dart';

class hotelReserveDetails extends StatelessWidget {
  final int id;
  DateTime? fromDate;
  DateTime? ToDate;
  String? name;
  String? phone;
  final TextEditingController _controllerInDate = TextEditingController();
  final TextEditingController _controllerOutDate = TextEditingController();
  final TextEditingController controllerWalletPass = TextEditingController();
  hotelReserveDetails({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HotelReservDetailsCubit>(context)
        .getHotelReservationDetails(id);
    return BlocBuilder<HotelReservDetailsCubit, HotelReservDetailsState>(
      builder: (context, state) {
        if (state is HotelReservDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HotelReservDetailsFailure) {
          return Center(
            child: Text('Failed to load HotelReservDetailss'),
          );
        } else if (state is HotelReservDetailsEmpty) {
          return Center(
            child: Text('No Hotels HotelReservDetails available.'),
          );
        } else if (state is HotelReservDetailsSuccess) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 70, left: 16, right: 16, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      height: 600,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            "Hotel Name",
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
                            state.reservation.hotel,
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
                                "Price",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Room Type",
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
                                state.reservation.price,
                                style: TextStyle(
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                state.reservation.roomType,
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
                                "Full Name:",
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
                                state.reservation.reservationDetails.fullName,
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
                            initialValue: state
                                .reservation.reservationDetails.phoneNumber,
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
                          Row(
                            children: [
                              Text(
                                "From Date",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _controllerInDate, readOnly: true,
                            //initialValue: "",
                            // onChanged: (value) {
                            //   fromDate.toString() = value;
                            // },
                            onTap: () async {
                              DateTime? result = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (result != null) {
                                //setState(() {
                                fromDate = result;
                                _controllerInDate.text = fromDate!
                                    .toIso8601String()
                                    .split('T')
                                    .first;
                              }
                            },
                            decoration: InputDecoration(
                              hintText:
                                  state.reservation.reservationDetails.fromDay,
                              prefixIcon: Icon(Icons.calendar_today,
                                  color: Color(0XFF1B4158)),
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
                                "To Date",
                                style: TextStyle(
                                  color: Color(0XFF1B4158),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _controllerOutDate, readOnly: true,
                            // initialValue: "",
                            // onChanged: (value) {
                            //   ToDate = value;
                            // },
                            onTap: () async {
                              DateTime? result = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (result != null) {
                                //setState(() {
                                ToDate = result;
                                _controllerOutDate.text =
                                    ToDate!.toIso8601String().split('T').first;
                              }
                            },
                            decoration: InputDecoration(
                              hintText:
                                  state.reservation.reservationDetails.toDay,
                              prefixIcon: Icon(Icons.calendar_today,
                                  color: Color(0XFF1B4158)),
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
                      child: BlocConsumer<UpdateHotelReservCubit,
                          UpdateHotelReservState>(
                        listener: (context, state2) {
                          if (state2 is UpdateHotelReservSuccess) {
                            // Handle success state
                            //   Navigator.pop(context);
                            // Navigator.pushNamed(
                            //     context, RoomBooking.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state2.message),
                              ),
                            );
                            //   Navigator.pop(context);
                            Navigator.pushNamed(context, MyBooking.id);
                          } else if (state2 is UpdateHotelReservFailure) {
                            // Handle failure state
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state2.message),
                              ),
                            );
                          }
                        },
                        builder: (context, state2) {
                          if (state2 is UpdateHotelReservLoading) {
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
                                          BlocProvider.of<UpdateHotelReservCubit>(
                                                  context)
                                              .UpdateHotelReserv(
                                                  phone_num: phone == null
                                                      ? state
                                                          .reservation
                                                          .reservationDetails
                                                          .phoneNumber
                                                      : phone!,
                                                  full_name: name == null
                                                      ? state
                                                          .reservation
                                                          .reservationDetails
                                                          .fullName
                                                      : name!,
                                                  wallet_pass:
                                                      controllerWalletPass.text,
                                                  //  email: email == null
                                                  //       ? state
                                                  //           .HotelReserv
                                                  //           .reservationDetails
                                                  //           .email
                                                  //       : email!,
                                                  id: id,
                                                  from_day: _controllerInDate
                                                              .text ==
                                                          null
                                                      ? state
                                                          .reservation
                                                          .reservationDetails
                                                          .fromDay
                                                      : _controllerInDate.text,
                                                  to_day: _controllerOutDate.text ==
                                                          null
                                                      ? state
                                                          .reservation
                                                          .reservationDetails
                                                          .fromDay
                                                      : _controllerOutDate.text);
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
