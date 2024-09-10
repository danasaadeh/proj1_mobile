import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/trip_cubit.dart';
import 'package:tourism/Features/trip-fav/cubit/fav_trip_cubit.dart';
import 'package:tourism/Features/trip-fav/cubit/fav_trip_state.dart';

import 'package:tourism/model/trips_model.dart';

class TripCard extends StatelessWidget {
  final ScrollController controller = ScrollController();
  double itemWidth = 350;
  double itemHeight = 180;
  bool is_favorites_page;
  final Trip trip;
  final VoidCallback press;

  TripCard(
      {super.key,
      required this.trip,
      required this.press,
      required this.is_favorites_page});

  @override
  Widget build(BuildContext context) {
    TripCubit cubit = BlocProvider.of<TripCubit>(context);
    FavTripCubit favCubit = BlocProvider.of<FavTripCubit>(context);
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              elevation: 7,
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: itemHeight,
                  width: itemWidth,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: trip.tripPhotos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: itemWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(trip.tripPhotos[index],
                            fit: BoxFit.cover),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 7,
            left: 8,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  controller.animateTo(
                    controller.offset - itemWidth,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 7,
            right: 8,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  controller.animateTo(
                    controller.offset + itemWidth,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),
          Positioned(
              bottom: 12,
              left: 14,
              child: Container(
                padding: const EdgeInsets.only(left: 16),
                width: 330,
                // height: 60,
                color: Colors.white.withOpacity(0.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      trip.tripName,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0XFF1B4158),
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0XFF1B4158),
                          size: 14,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          trip.fromDate,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13),
                        ),
                        // Text(
                        //   trip.toDate,
                        //   style: TextStyle(color: Colors.black, fontSize: 13),
                        // ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.location_on,
                          color: Color(0XFF1B4158),
                          size: 16,
                        ),
                        Text(
                          trip.destination,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        BlocBuilder<FavTripCubit, FavTripState>(
                          builder: (context, state) {
                            return IconButton(
                              icon: trip.fav
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_outline,
                                      color: Colors.red),
                              onPressed: () {
                                if (trip.fav) {
                                  favCubit.removeFromFavTrip(
                                      id: trip.id,
                                      context: context,
                                      is_FavTrips_page: is_favorites_page);
                                } else {
                                  favCubit.addToFavTrip(
                                      id: trip.id, context: context);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
