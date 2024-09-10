import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/cubit/Trips/trip_cubit.dart';
import 'package:tourism/Features/cubit/favourite/favourite_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_state.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_cubit.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_state.dart';
import 'package:tourism/Features/trip-fav/cubit/fav_trip_cubit.dart';
import 'package:tourism/Features/trip-fav/cubit/fav_trip_state.dart';
import 'package:tourism/model/attrac_model.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/trip_model.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/pages/hotel_details.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/widget/attrac_card.dart';
import 'package:tourism/widget/attrac_card/fav_card.dart';

import 'package:tourism/widget/hotel_card.dart';
import 'package:tourism/widget/hotel_card/fav_card.dart';
import 'package:tourism/widget/trip_card.dart';
import 'package:tourism/widget/trips_card/fav_card.dart';

class favouritPage extends StatelessWidget {
  static String id = "fav";
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Fav2Cubit>(context).getFav();
    BlocProvider.of<FavTripCubit>(context).getFav();
    BlocProvider.of<HotelFavCubit>(context).getFav();
    BlocProvider.of<TripCubit>(context).showAllTrip();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 51, 86, 116),
            title: const Text(
              "Favourite",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            bottom: const TabBar(
              labelColor: Colors.white,
              indicatorColor: const Color(0XFF1B4158),
              unselectedLabelColor: const Color.fromARGB(255, 21, 43, 56),
              tabs: [
                Tab(text: "Attractions"),
                Tab(text: "Hotels"),
                Tab(text: "Trips"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Attractions Page
              BlocBuilder<Fav2Cubit, Fav2State>(
                builder: (context, state) {
                  if (state is Fav2Initial || state is Fav2Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Fav2Success) {
                    // final attraction = state.attrac;
                    // final attractions = state.attraction;
                    if (BlocProvider.of<Fav2Cubit>(context).attrac!.isEmpty) {
                      return Center(
                          child: Text("There is no favourite Attraction"));
                    }
                  } else if (state is Fav2Empty) {
                    // Error state, display an error message
                    return Center(child: Text(state.message.toString()));
                  } else if (state is Fav2Failure) {
                    // Error state, display an error message
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    // State when there are no reviews available
                    return const Center(child: Text('....'));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: BlocProvider.of<Fav2Cubit>(context)
                              .attrac!
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                FavAttracCard(
                                  data: BlocProvider.of<Fav2Cubit>(context)
                                      .attrac![index],
                                  // attraction: BlocProvider.of<Fav2Cubit>(context)
                                  //     .attrac![index],
                                  width: double.infinity,
                                  is_favorites_page: true,
                                  press: () {
                                    // BlocProvider.of<AttracCubit>(context)
                                    //     .getAttracDetails(
                                    //         id: BlocProvider.of<AttracCubit>(
                                    //                 context)
                                    //             .attrac![index]
                                    //             .id);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AttractonDetails(
                                                  attraction: BlocProvider.of<
                                                          AttracCubit>(context)
                                                      .attrac![index],
                                                  // review: Attracs[index].review,
                                                )));
                                  },
                                  /* press: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => Scaffold(
                                                        body: Stack(
                                                          children: [
                                                             AttractonDetails(
                                                                 attraction:BlocProvider.of<AttracCubit>(context)
                                                    .attrac![index] ,
                                                                 ),
                                                            Positioned(
                                                              top: 20,
                                                              left: 10,
                                                              child: IconButton(
                                                                icon: const Icon(
                                                                  Icons.arrow_back,
                                                                  color: Colors.white,
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },*/
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              // Hotels Page
              // BlocBuilder<HotelFavCubit, HotelFavState>(
              //   builder: (context, state) {
              //     if (state is HotelFavInitial || state is HotelFavLoading) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (state is HotelFavSuccess) {
              //       // final attraction = state.attrac;
              //       // final attractions = state.attraction;
              //       if (BlocProvider.of<HotelFavCubit>(context)
              //           .fhotel!
              //           .isEmpty) {
              //         return const Text("There is no favourite Attraction");
              //       }
              //     } else if (state is HotelFavFailure) {
              //       // Error state, display an error message
              //       return Center(child: Text('Error: ${state.message}'));
              //     } else {
              //       // State when there are no reviews available
              //       return const Center(child: Text('....'));
              //     }
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Expanded(
              //             child: ListView.builder(
              //                 itemCount: BlocProvider.of<HotelFavCubit>(context)
              //                     .fhotel!
              //                     .length,
              //                 itemBuilder: (BuildContext context, int index) =>
              //                     Column(
              //                       children: [
              //                         FavhotelCard(
              //                           data: BlocProvider.of<HotelFavCubit>(
              //                                   context)
              //                               .fhotel![index],
              //                           is_favorites_page: true,
              //                           width: 150,
              //                           press: () {
              //                             /* Navigator.push(
              //                                     context,
              //                                     MaterialPageRoute(
              //                                         builder:
              //                                             (context) => Scaffold(
              //                                                   body: Stack(
              //                                                       children: [
              //                                                         tripDetails(
              //                                                           trip: BlocProvider.of<TripCubit>(context)
              //                                                               .trip![index],
              //                                                         ),
              //                                                         Positioned(
              //                                                           top: 20,
              //                                                           left:
              //                                                               10,
              //                                                           child:
              //                                                               IconButton(
              //                                                             icon:
              //                                                                 Icon(
              //                                                               Icons.arrow_back,
              //                                                               color:
              //                                                                   Colors.white,
              //                                                             ),
              //                                                             onPressed:
              //                                                                 () {
              //                                                               Navigator.pop(context);
              //                                                             },
              //                                                           ),
              //                                                         ),
              //                                                       ]),
              //                                                 )));*/
              //                           },
              //                         ),
              //                       ],
              //                     ))),
              //       ],
              //     );
              //   },
              // ),
              BlocBuilder<HotelFavCubit, HotelFavState>(
                builder: (context, state) {
                  if (state is HotelFavInitial || state is HotelFavLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HotelFavSuccess) {
                    // final attraction = state.attrac;
                    // final attractions = state.attraction;
                    if (BlocProvider.of<HotelFavCubit>(context)
                        .fhotel!
                        .isEmpty) {
                      return Center(
                          child: Text("There is no favourite Hotels"));
                    }
                  } else if (state is HotelFavEmpty) {
                    // Error state, display an error message
                    return Center(child: Text(state.message.toString()));
                  } else if (state is HotelFavFailure) {
                    // Error state, display an error message
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    // State when there are no reviews available
                    return const Center(child: Text('....'));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: BlocProvider.of<HotelFavCubit>(context)
                                  .fhotel!
                                  .length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                    children: [
                                      FavhotelCard(
                                          data: BlocProvider.of<HotelFavCubit>(
                                                  context)
                                              .fhotel![index],
                                          is_favorites_page: true,
                                          width: 400,
                                          press: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return hotelDetails(
                                                    hotelId: BlocProvider.of<
                                                                HotelFavCubit>(
                                                            context)
                                                        .fhotel![index]
                                                        .id);
                                              },
                                            ));
                                          }),
                                      const SizedBox(
                                        height: 15,
                                      )
                                    ],
                                  ))),
                      /*Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            clipBehavior: Clip.none,
                            physics: const ClampingScrollPhysics(),
                            itemCount: BlocProvider.of<HotelFavCubit>(context)
                                .fhotel!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return FavhotelCard(
                                data: BlocProvider.of<HotelFavCubit>(context)
                                    .fhotel![index],
                                is_favorites_page: true,
                                width: 200,
                                press: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return hotelDetails(
                                          hotelId:
                                              BlocProvider.of<HotelFavCubit>(
                                                      context)
                                                  .fhotel![index]
                                                  .id);
                                    },
                                  ));
                                },
                              );
                              /*   return hotelCard(
                                             hotelInfo: HotelInfo(
                                                 Room: hotels[index].Room,
                                                 location: hotels[index].location,
                                                 image: hotels[index].image,
                                                 name: hotels[index].name,
                                                 description: hotels[index].description,
                                                 amenities: hotels[index].amenities,
                                                 rate: hotels[index].rate,
                                                 review: hotels[index].review),
                                             press: () {
                                               Navigator.push(
                                                   context,
                                                   MaterialPageRoute(
                                                       builder: (context) => hotelDetails(
                                                             review: hotels[index].review,
                                                             Room: hotels[index].Room,
                                                             imagePath: hotels[index].image,
                                                             name: hotels[index].name,
                                                             location: hotels[index].location,
                                                             description:
                                                                 hotels[index].description,
                                                             amenities:
                                                                 hotels[index].amenities,
                                                             rate: hotels[index].rate,
                                                           )));
                                             },
                                             width: 120);*/
                            }),
                      ),*/
                    ],
                  );
                },
              ),
              // Trips Page
              BlocBuilder<FavTripCubit, FavTripState>(
                builder: (context, state) {
                  if (state is FavTripInitial || state is FavTripLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is FavTripSuccess) {
                    // final attraction = state.attrac;
                    // final attractions = state.attraction;
                    if (BlocProvider.of<FavTripCubit>(context).trip!.isEmpty) {
                      return Center(child: Text("There is no favourite Trips"));
                    }
                  } else if (state is FavTripEmpty) {
                    // Error state, display an error message
                    return Center(child: Text(state.message.toString()));
                  } else if (state is FavTripFailure) {
                    // Error state, display an error message
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    // State when there are no reviews available
                    return const Center(child: Text('....'));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: BlocProvider.of<FavTripCubit>(context)
                                  .trip!
                                  .length,
                              itemBuilder:
                                  (BuildContext context, int index) => Column(
                                        children: [
                                          FavTripCard(
                                            trip: BlocProvider.of<FavTripCubit>(
                                                    context)
                                                .trip![index],
                                            is_favorites_page: true,
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) => Scaffold(
                                                                body: Stack(
                                                                    children: [
                                                                      tripDetails(
                                                                        trip: BlocProvider.of<TripCubit>(context)
                                                                            .trip![index],
                                                                      ),
                                                                      Positioned(
                                                                        top: 20,
                                                                        left:
                                                                            10,
                                                                        child:
                                                                            IconButton(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.arrow_back,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              )));
                                            },
                                          ),
                                        ],
                                      ))),
                    ],
                  );
                },
              ),
            ],
          )),
    );
  }
}
