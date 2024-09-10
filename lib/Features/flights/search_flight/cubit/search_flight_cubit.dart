import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/flights/search_flight/cubit/search_flight_state.dart';
import 'package:tourism/Features/hotels/search/cubit/search_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/attraction_model.dart';
import 'package:tourism/model/hotel_search_model.dart';
import 'package:tourism/model/search_flight_model.dart';

class SearchFlightCubit extends Cubit<SearchFlightState> {
  SearchFlightCubit() : super(SearchFlightInitial());
  List<AvailableFlight>? flights;
  List<City>? cities;
  Future<void> getFilters() async {
    emit(SearchFlightLoading());
    try {
      print("before api request!!");

      final data =
          await Api().get(url: "${Api().base_url}/getAllFliters", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List city_map = jsonDecode(data.body)["data"]["cities"];

        cities = List<City>.from(city_map.map((e) => City.fromJson(e)));

        emit(SearchFlightGotFiltersSuccess());
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(SearchFlightFailure(message: e.toString()));
    }
  }

  Future<void> SearchRoundWayFlight({
    required String from_city,
    required String to_city,
    required String flight_class,
    required String passengers,
    required String depart_date,
    required String return_date,
  }) async {
    emit(SearchFlightLoading());
    try {
      final data = await Api().post(
        url: "${Api().base_url}/searchForAirwayFlight",
        body: {
          'from_city_id': from_city,
          'to_city_id': to_city,
          'passengers': passengers,
          'class_id': flight_class,
          'depart': depart_date,
          'return': return_date,
        },
        token: prefs!.getString("token"),
      );

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        final departFlightsData = response['data']['avalibale_depart_flight'];
        final returnFlightsData = response['data']['avalibale_return_flight'];

        List<AvailableFlight>? departFlights;
        List<AvailableFlight>? returnFlights;

        if (departFlightsData is List && returnFlightsData is List) {
          departFlights = (departFlightsData as List?)
              ?.map((e) => AvailableFlight.fromJson(e))
              .toList();
          returnFlights = (returnFlightsData as List?)
              ?.map((e) => AvailableFlight.fromJson(e))
              .toList();
          print('danaaaaaaaaaaaaaaaaa');
          print(returnFlights);
          print(departFlights);
          emit(SearchFlightRoundSuccess(
            message: response['message'],
            departFlights: departFlights,
            returnFlights: returnFlights,
          ));
        } else if (departFlightsData is String && returnFlightsData is String) {
          emit(SearchFlightRoundEmpty(
            message: "No flights found",
          ));
        } else if (departFlightsData is String) {
          returnFlights = (returnFlightsData as List?)
              ?.map((e) => AvailableFlight.fromJson(e))
              .toList();
          emit(SearchFlightRoundSuccess(
            message: departFlightsData,
            departFlights: [],
            returnFlights: returnFlights,
          ));
        } else if (returnFlightsData is String) {
          departFlights = (departFlightsData as List?)
              ?.map((e) => AvailableFlight.fromJson(e))
              .toList();
          print('danaaaaaaaaaaaaaaaaa');
          // print(returnFlights);
          print(departFlights);
          emit(SearchFlightRoundSuccess(
            message: returnFlightsData,
            departFlights: departFlights,
            returnFlights: [],
          ));
        }
      } else if (data.statusCode == 422) {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchFlightFailure(message: "There is something wrong.."));
    }
  }
  /* Future<void> SearchRoundWayFlight({
    required String from_city,
    required String to_city,
    required String flight_class,
    required String passengers,
    required String depart_date,
    required String return_date,
  }) async {
    emit(SearchFlightLoading());
    try {
      final data = await Api().post(
        url: "${Api().base_url}/searchForAirwayFlight",
        body: {
          'from_city_id': from_city,
          'to_city_id': to_city,
          'passengers': passengers,
          'class_id': flight_class,
          'depart': depart_date,
          'return': return_date,
        },
        token: prefs!.getString("token"),
      );

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        final departFlightsData = response['data']['avalibale_depart_flight'];
        final returnFlightsData = response['data']['avalibale_return_flight'];

        List<AvalibaleFlight>? departFlights;
        List<AvalibaleFlight>? returnFlights;

        if (departFlightsData is List) {
          departFlights = (departFlightsData as List?)
              ?.map((e) => AvalibaleFlight.fromJson(e))
              .toList();
        } else if (departFlightsData is String) {
          emit(SearchFlightRoundEmpty(
            message: departFlightsData,
          ));
          return;
        }

        if (returnFlightsData is List) {
          returnFlights = (returnFlightsData as List?)
              ?.map((e) => AvalibaleFlight.fromJson(e))
              .toList();
        } else if (returnFlightsData is String) {
          emit(SearchFlightRoundEmpty(
            message: returnFlightsData,
          ));
          return;
        }

        if (departFlights != null && returnFlights != null) {
          emit(SearchFlightRoundSuccess(
            message: response['message'],
            departFlights: departFlights,
            returnFlights: returnFlights,
          ));
        } else if (departFlights != null) {
          emit(SearchFlightRoundSuccess(
            message: response['message'],
            departFlights: departFlights,
            returnFlights: null,
          ));
        } else {
          emit(SearchFlightRoundEmpty(
            message: "${departFlightsData ?? ''} ${returnFlightsData ?? ''}",
          ));
        }
      } else if (data.statusCode == 422) {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchFlightFailure(message: "There is something wrong.."));
    }
  }*/

  /* Future<void> SearchRoundWayFlight({
    required String from_city,
    required String to_city,
    required String flight_class,
    required String passengers,
    required String depart_date,
    required String return_date,
  }) async {
    emit(SearchFlightLoading());
    try {
      final data = await Api().post(
        url: "${Api().base_url}/searchForAirwayFlight",
        body: {
          'from_city_id': from_city,
          'to_city_id': to_city,
          'passengers': passengers,
          'class_id': flight_class,
          'depart': depart_date,
          'return': return_date,
        },
        token: prefs!.getString("token"),
      );

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['data']['avalibale_depart_flight'] is String ||
            response['data']['avalibale_return_flight'] is String) {
          emit(SearchFlightRoundEmpty(
              message: (response['data']['avalibale_depart_flight'] as String) +
                  response['data']['avalibale_return_flight'] as String));
        } else {
          final departFlights =
              (response['data']['avalibale_depart_flight'] as List?)
                  ?.map((e) => AvalibaleFlight.fromJson(e))
                  .toList();
          final returnFlights =
              (response['data']['avalibale_return_flight'] as List?)
                  ?.map((e) => AvalibaleFlight.fromJson(e))
                  .toList();

          emit(SearchFlightRoundSuccess(
            message: jsonDecode(data.body)["message"],
            departFlights: departFlights,
            returnFlights: returnFlights,
          ));
        }
      } else if (data.statusCode == 422) {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchFlightFailure(message: "There is something wrong.."));
    }
  }*/

  /*Future<void> SearchRoundWayFlight({
    required String from_city,
    required String to_city,
    required String flight_class,
    required String passengers,
    required String depart_date,
    required String return_date,
  }) async {
    emit(SearchFlightLoading());
    try {
      print("before api request!!");

      String base_url = Api().base_url;
      // final requestBody = {};
      final data = await Api().post(
          url: "$base_url/searchForAirwayFlight",
          body: {
            ' from_city_id': from_city,
            'to_city_id': to_city,
            'passengers': passengers,
            'class_id': flight_class,
            'depart': depart_date,
            'return': return_date,
          },
          // jsonEncode(requestBody),
          //content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['hotels'] == null) {
          emit(SearchFlightEmpty(message: "there is no hotels like this"));
        } else {
          // hotels = (response['hotels'] as List)
          //     .map((e) => Hotels.fromJson(e['hotels']))
          //     .toList();
          flights = (response['flights'] as List)
              .map((e) => AvalibaleFlight.fromJson(e))
              .toList();
          emit(SearchFlightSuccess(
              flights: flights!, message: jsonDecode(data.body)["message"]));
        }
      } else if (data.statusCode == 422) {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchFlightFailure(message: "there is something wrong.."));
    }
  }*/

  Future<void> SearchOneWayFlight({
    required String from_city,
    required String to_city,
    required String flight_class,
    required String passengers,
    required String depart_date,
  }) async {
    emit(SearchFlightLoading());
    try {
      print("before api request!!");

      String base_url = Api().base_url;
      // final requestBody = {};
      final data = await Api().post(
          url: "$base_url/searchForAirwayFlight",
          body: {
            ' from_city_id': from_city,
            'to_city_id': to_city,
            'passengers': passengers,
            'class_id': flight_class,
            'depart': depart_date,
          },
          // jsonEncode(requestBody),
          //content: 'application/json',
          token: prefs!.getString("token"));
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        if (response['data']['avalibale_depart_flight'] is String) {
          emit(SearchFlightEmpty(
              message: response['data']['avalibale_depart_flight']));
        } else {
          // hotels = (response['hotels'] as List)
          //     .map((e) => Hotels.fromJson(e['hotels']))
          //     .toList();
          flights = (response['data']['avalibale_depart_flight'] as List)
              .map((e) => AvailableFlight.fromJson(e))
              .toList();
          emit(SearchFlightSuccess(
              flights: flights!, message: jsonDecode(data.body)["message"]));
        }
      } else if (data.statusCode == 422) {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(SearchFlightFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(SearchFlightFailure(message: "there is something wrong.."));
    }
  }
}
