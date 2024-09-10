import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/reserv/show_details/cubit/trip_reserv_details_cubit.dart';
import 'package:tourism/Features/flights/reservation/show_details/cubit/flight_reserv_details_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/show_details/cubit/hotel_reserv_details_cubit.dart';
import 'package:tourism/Features/reservations/cubit/reservation_cubit.dart';
import 'package:tourism/Features/reservations/cubit/reservation_state.dart';

import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/flight_result_model.dart';

import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/reservations.dart';
import 'package:tourism/model/trip_model.dart';

import 'package:tourism/pages/boarding_pass.dart';

import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/pages/update_reserv/flight_update_reserv.dart';
import 'package:tourism/pages/update_reserv/hotel_update_reserv.dart';
import 'package:tourism/pages/update_reserv/trip_update_reserv.dart';
import 'package:tourism/widget/delete_reservations/delete_flight_reserv_dialog.dart';
import 'package:tourism/widget/delete_reservations/delete_hotel_reserv_dialog.dart';

class MyBooking extends StatefulWidget {
  static String id = "mybooking";
  MyBooking({
    super.key,
    //required this.flight
  });
  //flightInfoRes flight;

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 86, 116),
        title: Text(
          'My Booking',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: const Color(0XFF1B4158),
          unselectedLabelColor: const Color.fromARGB(255, 21, 43, 56),
          controller: _tabController,
          tabs: [
            const Tab(text: 'Flight'),
            const Tab(text: ' Hotels'),
            const Tab(text: ' Trips'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FlightBookingsList(
              // FlightsRes: FlightsRes
              ),
          HotelBookingsList(
              // hotelss: hotelss
              ),
          TripBookingsList(
              //trips: trips,
              )
        ],
      ),
    );
  }
}

class FlightBookingsList extends StatelessWidget {
  FlightBookingsList();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReservationCubit>(context).getReservations();
    return BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
      if (state is ReservationLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ReservationSuccess) {
        List<FlightAllReservation> flightReservations =
            state.flightReservations;

        return ListView.builder(
          itemCount: flightReservations.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "lib/images/Premium Vector _ Air plane jet travel logo design.jpeg"
                        // mybook.name
                        ),
                    maxRadius: 43,
                  ),
                  // const SizedBox(width: 16),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            flightReservations[index].flightTimeId.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  flightReservations[index].fromCity.cityName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                                const Icon(
                                  Icons.airplane_ticket_rounded,
                                  color: Color(0XFF1B4158),
                                ),
                                Text(
                                  flightReservations[index].toCity.cityName,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  flightReservations[index].fromHour,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  flightReservations[index].toHour,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              flightReservations[index].departureDay,
                              style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFF1B4158)),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    BlocProvider.of<FlightReservDetailsCubit>(
                                            context)
                                        .getFlightReservDetails(
                                            flightReservations[index].id);
                                    return flightReserveDetails(
                                        id: flightReservations[index].id);
                                  },
                                ));
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) {
                                //     return BoardingPass(
                                //         //flightpass: null,
                                //         );
                                //   },
                                // ));
                                // Navigator.pushNamed(context, Personal_Info.id);
                              },
                              icon: const Icon(Icons.edit,
                                  size: 20, color: Colors.grey),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return flightDeleteReserveDialog(
                                        id: flightReservations[index].id);
                                  },
                                );
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return AlertDialog(
                                //       title: const Text(
                                //         'Confirm deletion',
                                //         style: TextStyle(
                                //             fontSize: 21,
                                //             color: Color(0XFF1B4158),
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       content: const Text(
                                //           '50% of the amount paid will be deducted when canceling the ticket reservation'),
                                //       actions: <Widget>[
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'Cancel',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'ok',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else if (state is ReservationEmpty) {
        return Center(
          child: Text('No Flight reservations available.'),
        );
      } else if (state is ReservationFailure) {
        return Center(
          child: Text('Failed to load reservations'),
        );
      } else {
        return Container();
      }
    });
  }
}

class HotelBookingsList extends StatelessWidget {
  // final List<HotelInfo> hotelss;

  HotelBookingsList(
      // required this.hotelss
      );

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReservationCubit>(context).getReservations();
    return BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
      if (state is ReservationLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ReservationSuccess) {
        List<HotelAllReservation> hotelReservations = state.hotelReservations;

        return ListView.builder(
          itemCount: hotelReservations.length,
          //hotelss.length,
          itemBuilder: (context, index) {
            // final book = hotelss[index];
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(hotelReservations[index].photo),
                    maxRadius: 35,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            hotelReservations[index].hotelName,
                            //book.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  hotelReservations[index].city.cityName,
                                  //  '  ${book.location}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                                Icon(
                                  Icons.hotel_class_rounded,
                                  color: Color(0XFF1B4158),
                                ),
                                Text(
                                  hotelReservations[index].stars.toString(),
                                  //'${book.rate}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  hotelReservations[index].fromDay,
                                  //'${book.firstdate}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  hotelReservations[index].toDay,
                                  //' ${book.lastdate}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    BlocProvider.of<HotelReservDetailsCubit>(
                                            context)
                                        .getHotelReservationDetails(
                                            hotelReservations[index].id);
                                    return hotelReserveDetails(
                                        id: hotelReservations[index].id);
                                  },
                                ));
                                //Navigator.pushNamed(context, Personal_Info.id);
                              },
                              icon: const Icon(Icons.edit,
                                  size: 20, color: Colors.grey),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return hotelDeleteReserveDialog(
                                        id: hotelReservations[index].id);
                                  },
                                );
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return AlertDialog(
                                //       title: const Text(
                                //         'Confirm deletion',
                                //         style: TextStyle(
                                //             fontSize: 21,
                                //             color: Color(0XFF1B4158),
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       content: const Text(
                                //           '50% of the amount paid will be deducted when canceling the ticket reservation'),
                                //       actions: <Widget>[
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'Cancel',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'ok',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else if (state is ReservationEmpty) {
        return Center(
          child: Text('No Hotel reservations available.'),
        );
      } else if (state is ReservationFailure) {
        return Center(
          child: Text('Failed to load reservations'),
        );
      } else {
        return Container();
      }
    });
  }
}

class TripBookingsList extends StatelessWidget {
  // final List<tripInfo> trips;

  TripBookingsList(
      // required this.trips
      );

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ReservationCubit>(context).getReservations();
    return BlocBuilder<ReservationCubit, ReservationState>(
        builder: (context, state) {
      if (state is ReservationLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ReservationSuccess) {
        List<TripAllReservation> tripReservations = state.tripReservations;
        return ListView.builder(
          itemCount: state.tripReservations.length,
          // trips.length,
          itemBuilder: (context, index) {
            //  final mybook = trips[index];
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(tripReservations[index].photo
                        // mybook.name
                        ),
                    maxRadius: 35,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            tripReservations[index].tripName,
                            // mybook.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tripReservations[index].destination,
                                  //'  ${mybook.location}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                                Icon(
                                  Icons.trip_origin_sharp,
                                  color: Color(0XFF1B4158),
                                ),
                                Text(
                                  tripReservations[index]
                                      .numberOfDays
                                      .toString(),
                                  // '${mybook.days}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFF1B4158)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tripReservations[index].fromDate,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  tripReservations[index].toDate,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                BlocProvider.of<TripReservDetailsCubit>(context)
                                    .getTripReservDetails(
                                        tripReservations[index].id);

                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return tripReserveDetails(
                                      id: tripReservations[index].id,
                                    );
                                  },
                                ));
                                //  Navigator.pushNamed(context, Personal_Info.id);
                              },
                              icon: const Icon(Icons.edit,
                                  size: 20, color: Colors.grey),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return hotelDeleteReserveDialog(
                                        id: tripReservations[index].id);
                                  },
                                );

                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return AlertDialog(
                                //       title: const Text(
                                //         'Confirm deletion',
                                //         style: TextStyle(
                                //             fontSize: 21,
                                //             color: Color(0XFF1B4158),
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       content: const Text(
                                //           '50% of the amount paid will be deducted when canceling the ticket reservation'),
                                //       actions: <Widget>[
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'Cancel',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //         TextButton(
                                //           onPressed: () {
                                //             Navigator.of(context).pop();
                                //           },
                                //           child: const Text(
                                //             'ok',
                                //             style: TextStyle(
                                //                 color: Color(0XFF1B4158),
                                //                 fontSize: 15),
                                //           ),
                                //         ),
                                //       ],
                                //     );
                                //   },
                                // );
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Color(0XFF1B4158),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      } else if (state is ReservationFailure) {
        return Center(
          child: Text('Failed to load reservations'),
        );
      } else if (state is ReservationEmpty) {
        return Center(
          child: Text('No Trips reservations available.'),
        );
      } else {
        return Container();
      }
    });
  }
}
