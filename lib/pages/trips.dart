import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/trip_cubit.dart';
import 'package:tourism/model/trip_model.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/widget/trip_card.dart';

class tripPage extends StatelessWidget {
  static String id = "trip";
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TripCubit>(context).showAllTrip();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 86, 116),
          title: const Text(
            "Trips",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Let's enjoy a beatiful journey",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<TripCubit, TripState>(
              builder: (context, state) {
                if (state is TripLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TripLoadedState) {
                  final trips = state.trip;

                  if (trips.isEmpty) {
                    return Center(child: Text('No data found.'));
                  }

                  return Expanded(
                      child: ListView.builder(
                          itemCount: trips.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Column(
                                children: [
                                  TripCard(
                                      trip: trips[index],
                                      is_favorites_page: false,
                                      press: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Scaffold(
                                                      body: Stack(children: [
                                                        tripDetails(
                                                          trip: trips[index],
                                                        ),
                                                        Positioned(
                                                          top: 20,
                                                          left: 10,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.arrow_back,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ]),
                                                    )));
                                      }),
                                ],
                              )));
                } else if (state is TripErrorState) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                return Container();
              },
            ),
          ],
        ));
  }
}
