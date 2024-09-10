import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_cubit.dart';
import 'package:tourism/Features/flights/passenger/delete/cubit/delete_flight_passenger_state.dart';
import 'package:tourism/Features/flights/passenger/show_all/cubit/show_all_flight_passenegers_cubit.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class DeleteFlightPassengerCubit extends Cubit<DeleteFlightPassengerState> {
  DeleteFlightPassengerCubit() : super(DeleteFlightPassengerInitial());

  void DeleteFlightPassenger(int passengerId, {required context}) async {
    emit(DeleteFlightPassengerLoading());
    try {
      // Perform the API call to delete the passenger with the given ID
      final data = await Api().get(
          url: "${Api().base_url}/deleteFlightPassenger/$passengerId",
          token: prefs!.getString("token"));

      if (data.statusCode == 200) {
        BlocProvider.of<ShowAllFlightPassengersCubit>(context)
            .getAllPassengers();
        emit(DeleteFlightPassengerSuccess(message: data.body));
      } else {
        emit(DeleteFlightPassengerFailure(
            message: 'Failed to delete passenger. Please try again.'));
      }
    } catch (e) {
      emit(DeleteFlightPassengerFailure(message: 'An error occurred: $e'));
    }
  }
}











//   void deleteAttraction(int AttractionId) async {
//   emit(AttractionLoadingState());

//   try {
//     String base_url = Api().base_url;

//     final response = await Api().get(
//       url: '$base_url/deleteAttraction/$AttractionId',
//     );
//     print('Response body: ${response.body}');
//     print('Status code: ${response.statusCode}');
//     print('deleeeeeeeeeeeet');
    
//     if (response.statusCode == 200) {
//       if (response.body == 'attraction is deleted successfully') {
//         print('Attraction deleted successfully');
        
//         emit(AttractionLoadedState([]));
//       } else {
//         emit(AttractionErrorState('Failed to delete Attraction'));
//       }
//     } else {
//       emit(AttractionErrorState('Failed to delete Attraction'));
//     }
//   } catch (e) {
//     print("Error occurred: $e");
//     emit(AttractionErrorState('An error occurred'));
//   }
// }

// }
