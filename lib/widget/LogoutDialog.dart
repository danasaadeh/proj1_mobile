import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/logout_cubit.dart';
import 'package:tourism/pages/login.dart';

class LogoutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogoutCubit cubit = BlocProvider.of<LogoutCubit>(context);
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
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

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false,
          );
        } else if (state is LogoutFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is LogoutLoading
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
                      "Are You Sure? you will be logged out of the account when you click OK",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      cubit.logout();
                    },
                    child: Text('Ok', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
      },
    );
  }
}
