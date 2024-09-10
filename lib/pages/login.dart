import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/login_cubit.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/pages/forgotpass.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/widget/customcurved.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  static String id = "login";
  GlobalKey<FormState> loginkey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  // Future<void> _checkLogin(BuildContext context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? savedEmail = prefs.getString('email');
  //   String? savedPassword = prefs.getString('password');

  //   if (savedEmail == _emailController.text &&
  //       savedPassword == _passwordController.text) {
  //     Navigator.pushReplacementNamed(context, Homepage.id);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Invsailed email or password')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
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
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return NavBar();
              },
            ));
          } else {
            showDialog(
                context: context,
                builder: ((context) => AlertDialog(
                      content: Text('you have no permission to enter this App'),
                    )));
          }
        } else if (state is LoginFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.message.toString()),
                  )));
          loginkey.currentState?.reset();
        } else if (state is LoginValidationFailure) {
          showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: Text(state.errors.toString()),
                  )));
        }
      },
      builder: (context, state) {
        return state is LoginLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScaffold(
                imagePath: "lib/images/Android Small - 1.png",
                child: SingleChildScrollView(
                  child: Center(
                    child: Form(
                      key: loginkey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 190,
                              ),
                              const Text(
                                "Welcome Back!",
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
                                        controller: _emailController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please enter email.";
                                          } else if (value !=
                                              prefs!.getString('email')) {
                                            state is LoginValidationFailure &&
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
                                  state is LoginValidationFailure &&
                                          state.errors.containsKey("email")
                                      ? Text(
                                          state.errors["email"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text(""),
                                ],
                              ),
                              const SizedBox(
                                height: 0.00001,
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
                                              state is LoginValidationFailure &&
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
                                        // obscureText: true,
                                        obscureText: cubit.is_scure,
                                        decoration: InputDecoration(
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
                                          prefixIcon: IconButton(
                                              onPressed: () {
                                                cubit.changeVisibility();
                                              },
                                              icon: cubit.is_scure
                                                  ? const Icon(
                                                      Icons.visibility_outlined,
                                                      color: Color(0XFF1B4158),
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .visibility_off_outlined,
                                                      color: Color(0XFF1B4158),
                                                    )),
                                          // prefixIcon: Icon(
                                          //   Icons.lock,
                                          //   color: Color(0XFF1B4158),
                                          // )
                                        ),
                                      ),
                                    ),
                                  ),
                                  state is LoginValidationFailure &&
                                          state.errors.containsKey("password")
                                      ? Text(
                                          state.errors["password"]![0],
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : Text("")
                                ],
                              ),
                              const SizedBox(
                                height: 0.001,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, ForgotPassword.id);
                                },
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 200),
                                    child: Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                          color: Color(0XFF4370A9),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
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
                                        cubit.login(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                      },
                                      child: const Text(
                                        "Log in",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            height: 0.01),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?  ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacementNamed(
                                          context, SignupPage.id);
                                    },
                                    child: const Text(
                                      'Sign up',
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
