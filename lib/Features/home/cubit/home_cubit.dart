import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/home/cubit/home_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<AttracHome>? attrac;
  List<HotelHome>? hotel;
  void getHotels() async {
    try {
      emit(HomeLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/topHotels');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(HomeEmpty(message: 'Empty'));
        } else if (responseData is List) {
          hotel =
              (responseData as List).map((e) => HotelHome.fromJson(e)).toList();
          emit(HomeHotelSuccess(hotels: hotel!));
        } else {
          // Unexpected data format
          emit(HomeFailure(message: 'Unexpected data format'));
        }
      } else {
        emit(HomeFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(HomeFailure(message: "Something went wrong: $e"));
    }
  }

  void getAttrac() async {
    try {
      emit(HomeLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/topAttractions');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(HomeEmpty(message: 'Empty'));
        } else if (responseData is List) {
          final attracList = (responseData as List)
              .map((e) => AttracHome.fromJson(e))
              .toList();
          emit(HomeAttracSuccess(attrac: attracList));
        } else {
          // Unexpected data format
          emit(HomeFailure(message: 'Unexpected data format'));
        }
      } else {
        emit(HomeFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(HomeFailure(message: "Something went wrong: $e"));
    }
  }

  void getFlights() async {
    try {
      emit(HomeLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/topFlights');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(HomeEmpty(message: 'Empty'));
        } else if (responseData is List) {
          final flightsList = (responseData as List)
              .map((e) => FlightHome.fromJson(e))
              .toList();
          emit(HomeFlightSuccess(flights: flightsList));
        } else {
          // Unexpected data format
          emit(HomeFailure(message: 'Unexpected data format'));
        }
      } else {
        emit(HomeFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(HomeFailure(message: "Something went wrong: $e"));
    }
  }

  void fetchHome() async {
    try {
      emit(HomeLoading());

      String base_url = Api().base_url;

      // Fetch admin data
      final flightData = await Api().get(url: '$base_url/topFlights');
      if (flightData.statusCode == 200) {
        final flightResponseData = jsonDecode(flightData.body);

        final flightList = (flightResponseData as List)
            .map((e) => FlightHome.fromJson(e))
            .toList();

        // Fetch chart table data
        final hotelData = await Api().get(url: '$base_url/topHotels');
        if (hotelData.statusCode == 200) {
          final hotelResponseData = jsonDecode(hotelData.body);

          hotel = (hotelResponseData as List)
              .map((e) => HotelHome.fromJson(e))
              .toList();

          // Fetch pie chart data
          final attracData = await Api().get(url: '$base_url/topAttractions');
          if (attracData.statusCode == 200) {
            final attracResponseData = jsonDecode(attracData.body);

            attrac = (attracResponseData as List)
                .map((e) => AttracHome.fromJson(e))
                .toList();

            // Emit the HomeSuccess state
            emit(HomeSuccess(
                hotels: hotel!, attrac: attrac!, flights: flightList));
          } else {
            emit(HomeEmpty(
              message: 'Error fetching  attractions data',
            ));
          }
        } else if (flightData.statusCode == 404) {
          emit(HomeEmpty(
            message: 'There are no hotels yet',
          ));
        } else {
          emit(HomeFailure(message: 'Error fetching hotels data'));
        }
      } else {
        emit(HomeFailure(message: 'Error fetching flights data'));
      }
    } on Exception catch (e) {
      emit(HomeFailure(message: "Something went wrong: $e"));
    }
  }
}
