import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/fav2/cubit/fav2_cubit.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_cubit.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_state.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/hotel_search_model.dart';

class hotelCard extends StatelessWidget {
  final Hotels data;
  final VoidCallback press;
  final double width;
  bool is_favorites_page;

  hotelCard({
    required this.data,
    required this.press,
    super.key,
    required this.width,
    required this.is_favorites_page,
  });

  @override
  Widget build(BuildContext context) {
    HotelFavCubit favCubit = BlocProvider.of<HotelFavCubit>(context);
    return GestureDetector(
      onTap: press,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              height: 230,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data.photo))),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data.hotelName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0XFF1B4158),
                        ),
                        Text(
                          data.city.cityName,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<HotelFavCubit, HotelFavState>(
                          builder: (context, state) {
                            return IconButton(
                              icon: data.fav
                                  //cubit.isFavorite(attraction.id)
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_outline,
                                      color: Colors.red),
                              onPressed: () {
                                if (data.fav) {
                                  favCubit.removeFromHotelFav(
                                      id: data.id,
                                      context: context,
                                      is_home_page: false,
                                      is_HotelFavs_page: is_favorites_page);
                                } else {
                                  favCubit.addToHotelFav(
                                      id: data.id,
                                      context: context,
                                      is_home_page: false);
                                }
                                // cubit.toggleFavorite(attraction.id);
                              },
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
