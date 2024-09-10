import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/reset_passwrd_cubit.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/login.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetPassword extends StatelessWidget {
  static String id = "resetpassword";
  GlobalKey<FormState> resetPasswordkey = GlobalKey();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ResetPasswrdCubit cubit = BlocProvider.of<ResetPasswrdCubit>(context);
    return BlocConsumer<ResetPasswrdCubit, ResetPasswrdState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          if (state.role == 4) {
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(state.message.toString()),
            );
            Navigator.pushReplacementNamed(context, Homepage.id);
          } else {
            showDialog(
                context: context,
                builder: ((context) => const AlertDialog(
                      content: Text('you have no permission to enter this App'),
                    )));
          }
        } else if (state is ResetPasswordFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
          resetPasswordkey.currentState?.reset();
        } else if (state is ResetPasswordValidationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.errors.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is ResetPasswordLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScaffold(
                imagePath: "lib/images/Android Small - 1.png",
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: resetPasswordkey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              const Text(
                                "Reset Password",
                                style: TextStyle(
                                    color: Color(0XFF1B4158),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 50),
                              const Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Enter your password",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                189, 158, 158, 158),
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: 0.01,
                                      ),
                                      Text(
                                        "your new password must be diffrent from previously used password",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                189, 158, 158, 158),
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        controller: _passwordController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter password";
                                          } else if (value !=
                                              prefs!.getString('password')) {
                                            state is ResetPasswordValidationFailure &&
                                                    state.errors
                                                        .containsKey("password")
                                                ? Text(
                                                    state
                                                        .errors["password"]![0],
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  )
                                                : const Text("");
                                          } else {
                                            return null;
                                          }
                                        },
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 0.9999),
                                            ),
                                            hintText: "password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Color(0XFF1B4158),
                                            )),
                                      ),
                                    ),
                                  ),
                                  state is ResetPasswordValidationFailure &&
                                          state.errors.containsKey("password")
                                      ? Text(
                                          state.errors["password"]![0],
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )
                                      : const Text("")
                                ],
                              ),
                              const SizedBox(
                                height: 0.01,
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        controller: _confpasswordController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter confirmation password";
                                          } else if (value !=
                                              prefs!.getString(
                                                  'passwordConfirm')) {
                                            state is ResetPasswordValidationFailure &&
                                                    state.errors
                                                        .containsKey("password")
                                                ? Text(
                                                    state
                                                        .errors["password"]![0],
                                                    style: const TextStyle(
                                                        color: Colors.red),
                                                  )
                                                : const Text("");
                                          } else {
                                            return null;
                                          }
                                        },
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0XFF1B4158),
                                                  width: 0.9999),
                                            ),
                                            hintText: "confirm password",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Color(0XFF1B4158),
                                            )),
                                      ),
                                    ),
                                  ),
                                  state is ResetPasswordValidationFailure &&
                                          state.errors.containsKey("password")
                                      ? Text(
                                          state.errors["password"]![0],
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )
                                      : const Text("")
                                ],
                              ),
                              const SizedBox(
                                height: 0.01,
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color(0XFF1B4158),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        cubit.reset_password(
                                            code: prefs?.getString('data'),
                                            password: _passwordController.text,
                                            password_confirmation:
                                                _confpasswordController.text);
                                      },
                                      child: const Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                  height: 100,
                                  width: 250,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor:
                                              const Color(0XFF1B4158),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        SnackBar(
                                          width: 200,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          content: const Text(
                                              "Email Verified successfully"),
                                        );

                                        resetPasswordkey.currentState?.reset();

                                        if (prefs?.getInt('role_email') == 4) {
                                          SnackBar(
                                            width: 200,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            content: const Text(
                                                "Email Verified successfully"),
                                          );

                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return Homepage();
                                            },
                                          ));
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: ((context) =>
                                                  const AlertDialog(
                                                    content: Text(
                                                        'you have no permission to enter this App'),
                                                  )));
                                        }
                                      },
                                      child: const Text(
                                        "Skip",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                            ]),
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
