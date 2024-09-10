import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/home/cubit/home_cubit.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_state.dart';
import 'package:tourism/Features/hotels/search/cubit/search_cubit.dart';
import 'package:tourism/Features/hotels/show_hotel_details/cubit/show_hotel_details_cubit.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/fav_hotel_model.dart';

class HotelFavCubit extends Cubit<HotelFavState> {
  HotelFavCubit() : super(HotelFavInitial());

  late List<FavHotel>? fhotel;
  void getFav() async {
    try {
      emit(HotelFavLoading());

      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showFavoriteHotel');
      print(data.body.toString());
      if (data.statusCode == 200) {
        if (data.body is String) {
          emit(HotelFavEmpty(message: jsonDecode(data.body)["message"]));
        }
        List datamap = jsonDecode(data.body)["data"];
        fhotel = List<FavHotel>.from(datamap.map((e) => FavHotel.fromJson(e)));
        emit(HotelFavSuccess());
      } else {
        emit(HotelFavFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      emit(HotelFavFailure(message: "something is wrong ..."));
    }
  }

  void addToHotelFav(
      {required int id, required context, required bool is_home_page}) async {
    emit(HotelFavLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/addHotelToFavorite/$id",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(await data.body);
      print(data_map);
      if (data.statusCode == 200) {
        if (is_home_page) {
          BlocProvider.of<HomeCubit>(context)
              .hotel!
              .firstWhere((element) => element.hotelId == id)
              .fav = true;
        } else {
          BlocProvider.of<SearchHotelCubit>(context)
              .hotels!
              .firstWhere((element) => element.id == id)
              .fav = true;
        }

        emit(HotelFavSuccess());
      } else {
        emit(HotelFavFailure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(HotelFavFailure(message: "there is something wrong.."));
    }
  }

  void removeFromHotelFav({
    required int id,
    required context,
    required bool is_HotelFavs_page,
    required bool is_home_page,
  }) async {
    emit(HotelFavLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().get(
        url: "$base_url/deleteHotelFromFavorite/$id}",
        token: prefs!.getString('token'),
      );
      var data_map = jsonDecode(data.body);
      print(data_map);
      if (data.statusCode == 200) {
        if (is_HotelFavs_page) {
          fhotel!.removeWhere((element) => element.id == id);
        } else {
          if (is_home_page) {
            BlocProvider.of<HomeCubit>(context)
                .hotel!
                .firstWhere((element) => element.hotelId == id)
                .fav = false;
          } else {
            BlocProvider.of<SearchHotelCubit>(context)
                .hotels!
                .firstWhere((element) => element.id == id)
                .fav = false;
          }
        }
        emit(HotelFavSuccess());
      } else {
        emit(HotelFavFailure(message: data_map["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(HotelFavFailure(message: "there is something wrong.."));
    }
  }
}
