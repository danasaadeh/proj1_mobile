import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_state.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/model/flight_details.dart';

class ShowFlightDetailsCubit extends Cubit<ShowFlightDetailsState> {
  ShowFlightDetailsCubit() : super(ShowFlightDetailsInitial());
  FlightDetails? flight;
  void getFlightDetails(int? id) async {
    try {
      emit(ShowFlightDetailsLoading());
      String base_url = Api().base_url;
      final data =
          await Api().get(url: '$base_url/showFlightDetails/$id', token: null);

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        final flightDetailsData = responseData['data'];

        flight = FlightDetails.fromJson(flightDetailsData);

        // final responseData = jsonDecode(data.body);

        // // print(responseData.toString());

        // final flightDetails = FlightDetails.fromJson(responseData);

        emit(ShowFlightDetailsSuccess(flightDetails: flight!));
      } else {
        final errorMessage = 'Error ${data.statusCode}: ${data.reasonPhrase}';
        emit(ShowFlightDetailsFailure(message: errorMessage));
      }
    } on Exception catch (e) {
      emit(ShowFlightDetailsFailure(message: "Something went wrong: $e"));
    }
  }
}
