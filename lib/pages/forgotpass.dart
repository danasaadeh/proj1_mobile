import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/email_verification_cubit.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/pages/verification.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatelessWidget {
  static String id = "forgotpassword";
  GlobalKey<FormState> forgotpasswordkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EmailVerificationCubit cubit =
        BlocProvider.of<EmailVerificationCubit>(context);
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     width: 200,
          //     backgroundColor: Theme.of(context).colorScheme.secondary,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     behavior: SnackBarBehavior.floating,
          //     content: Text(state.message.toString()),
          //   ),
          // );
          SnackBar(
            width: 200,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text(state.message.toString()),
          );

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Verifictication();
            },
          ));
        } else if (state is EmailVerificationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
          forgotpasswordkey.currentState?.reset();
        } else if (state is EmailVerificationValidationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.errors.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is EmailVerificationLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScaffold(
                imagePath: "lib/images/Android Small - 1.png",
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: forgotpasswordkey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              const Text(
                                "Forgot Password",
                                style: TextStyle(
                                    color: Color(0XFF1B4158),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 50),
                              Column(
                                children: [
                                  Text(
                                    "Mail Address Here",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(189, 158, 158, 158),
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 0.01,
                                  ),
                                  Text(
                                    "enter the email address aisocaited with you account",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
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
                                      padding: const EdgeInsets.all(20),
                                      child: TextFormField(
                                        controller: _emailController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter email.";
                                          } else if (value !=
                                              prefs!.getString('email')) {
                                            state is EmailVerificationValidationFailure &&
                                                    state.errors
                                                        .containsKey("email")
                                                ? Text(
                                                    state.errors["email"]![0],
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )
                                                : Text("");
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              borderSide: BorderSide(
                                                  color: Color(0XFF4370A9),
                                                  width: 0.9999),
                                            ),
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Color(0XFF1B4158),
                                            )),
                                      ),
                                    ),
                                  ),
                                  state is EmailVerificationValidationFailure &&
                                          state.errors.containsKey("email")
                                      ? Text(
                                          state.errors["email"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text("")
                                ],
                              ),
                              const SizedBox(
                                height: 0.01,
                              ),
                              SizedBox(
                                  height: 105,
                                  width: 280,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color(0XFF1B4158),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        cubit.email_verification(
                                          email: _emailController.text,
                                        );
                                      },
                                      child: const Text(
                                        "Recover Password",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 30,
                              )
                            ]),
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
