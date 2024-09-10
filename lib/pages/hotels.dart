import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/hotels/show_hotel_details/cubit/show_hotel_details_cubit.dart';
import 'package:tourism/model/hotel_model.dart';
import 'package:tourism/model/hotel_search_model.dart';
import 'package:tourism/pages/hotel_details.dart';
import 'package:tourism/pages/hotels_filter.dart';
import 'package:tourism/widget/hotel_card.dart';

class hotelPage extends StatelessWidget {
  static String id = "page";
  final List<Hotels> data;

  const hotelPage({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Hotels",
            style: TextStyle(color: Color(0XFF1B4158)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 19,
                  backgroundColor: const Color(0XFF2C516C).withOpacity(0.9),
                  child: IconButton(
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return FilterOptionsDialog();
                        },
                      );
                    },
                  )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    physics: const ClampingScrollPhysics(),
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return hotelCard(
                          data: data[index],
                          is_favorites_page: false,
                          // hotelInfo: HotelInfo(
                          //     review: hotels[index].review,
                          //     Room: hotels[index].Room,
                          //     location: hotels[index].location,
                          //     image: hotels[index].image,
                          //     name: hotels[index].name,
                          //     description: hotels[index].description,
                          //     amenities: hotels[index].amenities,
                          //     rate: hotels[index].rate),
                          press: () {
                            // BlocProvider.of<ShowHotelDetailsCubit>(context)
                            //     .getHotelDetails(data[index].id);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return hotelDetails(hotelId: data[index].id);
                              },
                            ));
                            /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => hotelDetails(

                                          Room: hotels[index].Room,
                                          imagePath: hotels[index].image,
                                          name: hotels[index].name,
                                          location: hotels[index].location,
                                          description:
                                              hotels[index].description,
                                          amenities: hotels[index].amenities,
                                          rate: hotels[index].rate,
                                          review: hotels[index].review,
                                        )));*/
                          },
                          width: 120);
                    }),
              ),
            ],
          ),
        ));
  }
}
