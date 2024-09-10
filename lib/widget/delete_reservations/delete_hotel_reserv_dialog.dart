import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/hotels/hotel_reserv/delet_reserv/cubit/delete_hotel_reserv_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/delet_reserv/cubit/delete_hotel_reserv_state.dart';
import 'package:tourism/Features/reservations/cubit/reservation_cubit.dart';

class hotelDeleteReserveDialog extends StatelessWidget {
  final int id;

  const hotelDeleteReserveDialog({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    DeleteHotelReservCubit cubit =
        BlocProvider.of<DeleteHotelReservCubit>(context);
    return BlocConsumer<DeleteHotelReservCubit, DeleteHotelReservState>(
      listener: (context, state) {
        if (state is DeleteHotelReservSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(state.message.toString()),
            ),
          );
        } else if (state is DeleteHotelReservError) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is DeleteHotelReservLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AlertDialog(
                backgroundColor: Color.fromARGB(255, 51, 86, 116),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Your reservation will be deleted when you click OK",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<ReservationCubit>(context)
                          .getReservations();
                      // Close the dialog
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.deleteDeleteHotelReserv(id);
                    },
                    child: Text('Ok', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
      },
    );
  }
}
