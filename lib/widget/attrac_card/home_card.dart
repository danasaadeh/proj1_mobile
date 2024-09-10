import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_details_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_state.dart';

import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/home.dart';

// ignore: camel_case_types
class HomeAttracCard extends StatelessWidget {
  final AttracHome data;

  final VoidCallback press;
  final double width;
  bool is_favorites_page;
  bool is_home_page;
  HomeAttracCard({
    required this.data,
    required this.is_favorites_page,
    required this.is_home_page,
    required this.press,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // AttracCubit cubit = BlocProvider.of<AttracCubit>(context);
    Fav2Cubit favCubit = BlocProvider.of<Fav2Cubit>(context);
    return GestureDetector(
      onTap: press,
      child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              height: 260,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                              image: NetworkImage(
                                data.photo.isNotEmpty
                                    ? data.photo
                                    : "lib/images/photo_2024-05-14_13-19-25.jpg",
                              ))),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.attracName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Color(0XFF1B4158)),
                        Text(
                          data.attracCity,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<Fav2Cubit, Fav2State>(
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
                                  favCubit.removeFromFav2(
                                      id: data.attracId,
                                      context: context,
                                      is_Fav2s_page: is_favorites_page,
                                      is_home_page: is_home_page);
                                } else {
                                  favCubit.addToFav2(
                                      id: data.attracId,
                                      context: context,
                                      is_home_page: is_home_page);
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
