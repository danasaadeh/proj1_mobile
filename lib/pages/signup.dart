import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/register_cubit.dart';

import 'package:tourism/helper/constante.dart';
import 'package:tourism/pages/login.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatelessWidget {
  static String id = "signup";
  GlobalKey<FormState> signupkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  // Future<void> _saveUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', _nameController.text);
  //   prefs.setString('email', _emailController.text);
  //   prefs.setString('password', _passwordController.text);
  //   prefs.setString('confpassword', _confpasswordController.text);
  // }

  @override
  Widget build(BuildContext context) {
    RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if (state.role_id == 4) {
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(state.message.toString()),
            );
            Navigator.pushReplacementNamed(context, LoginPage.id);
          } else {
            showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      content: Text('you have no permission to enter this App'),
                    )));
          }
        } else if (state is RegisterFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
          signupkey.currentState?.reset();
        } else if (state is RegisterValidationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.errors.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is RegisterLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScaffold(
                imagePath: "lib/images/Android Small - 1.png",
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: signupkey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 150,
                              ),
                              const Text(
                                "Create new account",
                                style: TextStyle(
                                    color: Color(0XFF1B4158),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 60),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        controller: _nameController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter name.";
                                          } else if (value !=
                                              prefs!.getString('name')) {
                                            state is RegisterValidationFailure &&
                                                    state.errors
                                                        .containsKey("name")
                                                ? Text(
                                                    state.errors["name"]![0],
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
                                                  color: Color(0XFF1B4158),
                                                  width: 0.9999),
                                            ),
                                            hintText: "User Name",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Color(0XFF1B4158),
                                            )),
                                      ),
                                    ),
                                  ),
                                  state is RegisterValidationFailure &&
                                          state.errors.containsKey("name")
                                      ? Text(
                                          state.errors["name"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text(""),
                                ],
                              ),
                              SizedBox(
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
                                        controller: _emailController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter email.";
                                          } else if (value !=
                                              prefs!.getString('email')) {
                                            state is RegisterValidationFailure &&
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
                                                  color: Color(0XFF1B4158),
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
                                  state is RegisterValidationFailure &&
                                          state.errors.containsKey("email")
                                      ? Text(
                                          state.errors["email"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text(""),
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
                                        controller: _passwordController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please enter password.";
                                            } else if (value !=
                                                prefs!.getString('password')) {
                                              state is RegisterValidationFailure &&
                                                      state.errors.containsKey(
                                                          "pasword")
                                                  ? Text(
                                                      state.errors["email"]![0],
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  : Text("");
                                            } else {
                                              return null;
                                            }
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
                                  state is RegisterValidationFailure &&
                                          state.errors.containsKey("password")
                                      ? Text(
                                          state.errors["password"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text("")
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please confirm password.";
                                            } else if (value !=
                                                prefs!.getString(
                                                    'password_confirmation')) {
                                              state is RegisterValidationFailure &&
                                                      state.errors.containsKey(
                                                          "password_confirmation")
                                                  ? Text(
                                                      state.errors["email"]![0],
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  : Text("");
                                            } else {
                                              return null;
                                            }
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
                                ],
                              ),
                              const SizedBox(
                                height: 0.01,
                              ),
                              SizedBox(
                                  height: 75,
                                  width: 240,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          backgroundColor: Color(0XFF1B4158),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20)),
                                      onPressed: () {
                                        cubit.register(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                            password_confirmation:
                                                _confpasswordController.text);
                                      },
                                      child: const Text(
                                        "sign up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.1),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Already have an account?   ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, LoginPage.id);
                                    },
                                    child: const Text(
                                      'Log in',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0XFF1B4158),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ));
      },
    );
  }
}
