import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tourism/Features/reservations/cubit/reservation_state.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/model/reservations.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  void getReservations() async {
    emit(ReservationLoading());
    try {
      String base_url = Api().base_url;
      final response =
          await Api().get(url: "$base_url/showMyReservation", token: null);

      if (response.statusCode == 200) {
        List<FlightAllReservation> flightReservations = [];
        List<HotelAllReservation> hotelReservations = [];
        List<TripAllReservation> tripReservations = [];

        Map<String, dynamic> responseJson = json.decode(response.body);

        // Populate flight reservations
        if (responseJson.containsKey('flight_reservations')) {
          for (var reservation in responseJson['flight_reservations']) {
            flightReservations.add(FlightAllReservation.fromJson(reservation));
          }
        }

        // Populate hotel reservations
        if (responseJson.containsKey('hotel_reservations')) {
          for (var reservation in responseJson['hotel_reservations']) {
            hotelReservations.add(HotelAllReservation.fromJson(reservation));
          }
        }

        // Populate trip reservations
        if (responseJson.containsKey('trip_reservations')) {
          for (var reservation in responseJson['trip_reservations']) {
            tripReservations.add(TripAllReservation.fromJson(reservation));
          }
        }

        // Emit success state if at least one list has data
        if (flightReservations.isNotEmpty ||
            hotelReservations.isNotEmpty ||
            tripReservations.isNotEmpty) {
          emit(ReservationSuccess(
            flightReservations: flightReservations,
            hotelReservations: hotelReservations,
            tripReservations: tripReservations,
          ));
        } else {
          emit(ReservationEmpty(message: 'No reservations available.'));
        }
      } else {
        emit(ReservationFailure(message: 'Failed to load reservations'));
      }
    } catch (e) {
      emit(ReservationFailure(
          message: 'An error occurred while fetching reservations.'));
    }
  }
  /*void getReservations() async {
    emit(ReservationLoading());
    try {
      String base_url = Api().base_url;
      final response =
          await Api().get(url: "$base_url/showMyReservation", token: null);

      if (response.statusCode == 200) {
        List<FlightAllReservation> flightReservations = [];
        List<HotelAllReservation> hotelReservations = [];
        List<TripAllReservation> tripReservations = [];

        Map<String, dynamic> responseJson = json.decode(response.body);

        if (responseJson.containsKey('flight_reservations')) {
          for (var reservation in responseJson['flight_reservations']) {
            flightReservations.add(FlightAllReservation.fromJson(reservation));
          }
        }

        if (responseJson.containsKey('hotel_reservations')) {
          for (var reservation in responseJson['hotel_reservations']) {
            hotelReservations.add(HotelAllReservation.fromJson(reservation));
          }
        }

        if (responseJson.containsKey('trip_reservations')) {
          for (var reservation in responseJson['trip_reservations']) {
            tripReservations.add(TripAllReservation.fromJson(reservation));
          }
        }
        // if (flightReservations.isNotEmpty &&
        //     hotelReservations.isEmpty &&
        //     tripReservations.isEmpty) {
        //   emit(ReservationSuccess(
        //     flightReservations: flightReservations,
        //     hotelReservations: [],
        //     tripReservations: [],
        //   ));
        // }
        // if (flightReservations.isEmpty &&
        //     hotelReservations.isNotEmpty &&
        //     tripReservations.isEmpty) {
        //   emit(ReservationSuccess(
        //     flightReservations: [],
        //     hotelReservations: hotelReservations,
        //     tripReservations: [],
        //   ));
        // }
        // if (flightReservations.isEmpty &&
        //     hotelReservations.isEmpty &&
        //     tripReservations.isNotEmpty) {
        //   emit(ReservationSuccess(
        //     flightReservations: [],
        //     hotelReservations: [],
        //     tripReservations: tripReservations,
        //   ));
        // }

        if (flightReservations.isNotEmpty &&
            hotelReservations.isNotEmpty &&
            tripReservations.isNotEmpty) {
          emit(ReservationSuccess(
            flightReservations: flightReservations,
            hotelReservations: hotelReservations,
            tripReservations: tripReservations,
          ));
        } else {
          emit(ReservationEmpty(message: 'No reservations available.'));
        }
      } else {
        emit(ReservationFailure(message: 'Failed to load reservations'));
      }
    } catch (e) {
      emit(ReservationFailure(
          message: 'An error occurred while fetching reservations.'));
    }
  }*/

  /*Future<void> getReservations() async {
    emit(ReservationLoading());
    try {
      final data = await Api().get(
        url: "${Api().base_url}/showMyReservation",
        token: null,
      );

      if (data.statusCode == 200) {
        final response = jsonDecode(data.body);
        final flightReservData = response['flight_reservations'];
        final hotelReservData = response['hotel_reservations'];
        final tripReservData = response['trip_reservations'];
        final List<FlightAllReservation>? flightReservations;
        final List<HotelAllReservation>? hotelReservations;
        final List<TripAllReservation>? tripReservations;
        // List<AvailableFlight>? departFlights;
        // List<AvailableFlight>? returnFlights;

        if (flightReservData is List &&
            hotelReservData is List &&
            tripReservData is List) {
          flightReservations = (flightReservData as List?)
              ?.map((e) => FlightAllReservation.fromJson(e))
              .toList();
          hotelReservations = (hotelReservData as List?)
              ?.map((e) => HotelAllReservation.fromJson(e))
              .toList();
          tripReservations = (tripReservData as List?)
              ?.map((e) => TripAllReservation.fromJson(e))
              .toList();
          print('danaaaaaaaaaaaaaaaaa');
          print(flightReservations);
          print(hotelReservations);
          print(tripReservations);
          emit(ReservationSuccess(
              // message: response['message'],
              tripReservations: tripReservations!,
              flightReservations: flightReservations!,
              hotelReservations: hotelReservations!));
        } else if (flightReservData.isEmpty &&
            hotelReservData.isEmpty &&
            tripReservData.isEmpty) {
          emit(ReservationEmpty(
            message: "There is no reservations",
          ));
        } else if (flightReservData.isEmpty) {
          hotelReservations = (hotelReservData as List?)
              ?.map((e) => HotelAllReservation.fromJson(e))
              .toList();
          emit(ReservationSuccess(
              // message: departFlightsData,
              flightReservations: [],
              hotelReservations: hotelReservations!,
              tripReservations: []));
        } else if (hotelReservData.isEmpty) {
          flightReservations = (flightReservData as List?)
              ?.map((e) => FlightAllReservation.fromJson(e))
              .toList();
          print('danaaaaaaaaaaaaaaaaa');
          // print(returnFlights);

          emit(ReservationSuccess(
              // message: returnFlightsData,
              flightReservations: flightReservations!,
              hotelReservations: [],
              tripReservations: []));
        } else if (tripReservData.isEmpty) {
          hotelReservations = (hotelReservData as List?)
              ?.map((e) => HotelAllReservation.fromJson(e))
              .toList();
          print('danaaaaaaaaaaaaaaaaa');
          // print(returnFlights);
          // print(hotelReservations);
          emit(ReservationSuccess(
              // message: returnFlightsData,
              flightReservations: [],
              hotelReservations: hotelReservations!,
              tripReservations: []));
        }
      } else if (data.statusCode == 422) {
        emit(ReservationFailure(message: jsonDecode(data.body)["message"]));
      } else {
        emit(ReservationFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(ReservationFailure(message: "There is something wrong.."));
    }
  }*/
  // void getReservations() async {
  //   emit(ReservationLoading());
  //   try {
  //     String base_url = Api().base_url;
  //     final response =
  //         await Api().get(url: "$base_url/showMyReservation", token: null);
  //     if (response.statusCode == 200) {
  //       List<FlightAllReservation> flightReservations = [];
  //       List<HotelAllReservation> hotelReservations = [];
  //       List<TripAllReservation> tripReservations = [];

  //       Map<String, dynamic> responseJson = json.decode(response.body);
  //       if (responseJson.containsKey('flight_reservations')) {
  //         for (var reservation in responseJson['flight_reservations']) {
  //           flightReservations.add(FlightAllReservation.fromJson(reservation));
  //         }
  //       }
  //       if (responseJson.containsKey('hotel_reservations')) {
  //         for (var reservation in responseJson['hotel_reservations']) {
  //           hotelReservations.add(HotelAllReservation.fromJson(reservation));
  //         }
  //       }
  //       if (responseJson.containsKey('trip_reservations')) {
  //         for (var reservation in responseJson['trip_reservations']) {
  //           tripReservations.add(TripAllReservation.fromJson(reservation));
  //         }
  //       }

  //       emit(ReservationSuccess(
  //         flightReservations: flightReservations,
  //         hotelReservations: hotelReservations,
  //         tripReservations: tripReservations,
  //       ));
  //     } else {
  //       emit(ReservationFailure(message: 'Failed to load reservations'));
  //     }
  //   } catch (e) {
  //     emit(ReservationFailure(message: ''));
  //   }
  // }
}
