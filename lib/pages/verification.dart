import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';
import 'package:tourism/Features/cubit/Auth/check_code_cubit.dart';
import 'package:tourism/Features/cubit/Auth/check_code_state.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/resetpass.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otp_text_field/otp_text_field.dart';

class Verifictication extends StatelessWidget {
  // static String id = "verifictication";
  GlobalKey<FormState> _codekey = GlobalKey();
  final TextEditingController _CodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CheckCodeCubit cubit = BlocProvider.of<CheckCodeCubit>(context);
    return BlocConsumer<CheckCodeCubit, CheckCodeState>(
      listener: (context, state) {
        if (state is CheckCodeSuccess) {
          SnackBar(
            width: 200,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            content: Text(state.message.toString()),
          );
          /* showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text('Verified successfully'),
                  )));*/

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return ResetPassword();
            },
          ));
        } else if (state is CheckCodeResend) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text("Resend Successfully"),
                  )));

          // استمرار إعادة توجيه المستخدم بعد إعادة إرسال الكود
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return Verifictication();
            },
          ));
        } else if (state is CheckCodeFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
          _codekey.currentState?.reset();
        } else if (state is CheckCodeValidationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.errors.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is CheckCodeLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScaffold(
                imagePath: "lib/images/Android Small - 1.png",
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: _codekey,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 190,
                              ),
                              const Text(
                                "Email Verification",
                                style: TextStyle(
                                    color: Color(0XFF1B4158),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 50),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Get your code ",
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
                                    "please enter the 6 digit code that send to your email address",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Column(
                                    children: [
                                      Pinput(
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter code";
                                          } else if (value !=
                                              prefs?.getString('data')) {
                                            state is CheckCodeValidationFailure &&
                                                    state.errors
                                                        .containsKey("code")
                                                ? Text(
                                                    state.errors["code"]![0],
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  )
                                                : Text("");
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: _CodeController,
                                        length: 6,
                                        onCompleted: (pin) => debugPrint(pin),
                                      ),
                                      state is CheckCodeValidationFailure &&
                                              state.errors.containsKey("code")
                                          ? Text(
                                              state.errors["code"]![0],
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          : Text("")
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 35,
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
                                          backgroundColor: Color(0XFF1B4158),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        cubit.check_code(
                                          code: _CodeController.text,
                                        );
                                      },
                                      child: const Text(
                                        "Verify and proceed",
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
                                          backgroundColor: Color(0XFF1B4158),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: ((context) => AlertDialog(
                                                  content: Text(
                                                      "Resend Succesfully"),
                                                )));
                                        cubit.email_verification(
                                            email: prefs!
                                                .getString('email')
                                                .toString());
                                      },
                                      child: const Text(
                                        "Resend code",
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
