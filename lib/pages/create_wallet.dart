import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/wallet/create_wallet/cubit/create_wallet_cubit.dart';
import 'package:tourism/Features/wallet/create_wallet/cubit/create_wallet_state.dart';
import 'package:tourism/pages/creatwallet_success.dart';
import 'package:tourism/pages/wallet_page.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class creatWallet extends StatelessWidget {
  static String id = "creat wallet";
  final TextEditingController controllerIncome = TextEditingController();
  final TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Image.asset(
                "lib/images/wallet2.png",
                width: 400,
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<CreateWalletCubit, CreateWalletState>(
                listener: (context, state) {
                  if (state is CreateWalletFailure) {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              content: Text(state.message.toString()),
                            )));
                  }
                  if (state is CreateWalletSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        width: 200,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        behavior: SnackBarBehavior.floating,
                        content: Text(state.message.toString()),
                      ),
                    );

                    // _formKey.currentState?.reset();
                    Navigator.pushReplacementNamed(
                        context, createwalletSuccess.id);
                  }
                },
                builder: (context, state) {
                  if (state is CreateWalletLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                      TextFormField(
                        controller: controllerIncome,
                        cursorColor: Colors.blue,

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money),
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Your wallet balance',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Your wallet balance';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   income = value!;
                        // },
                      ),
                      // CustomTextField(
                      //   labelText: "Your wallet balance",
                      //   prefixIcon: Icons.attach_money,
                      //   controller: controllerIncome,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controllerPass,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.wallet),
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Your Wallet Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the seats number';
                          }
                          return null;
                        },
                        // onSaved: (value) {
                        //   _seatsNum = value!;
                        // },
                      ),
                      // CustomTextField(
                      //   labelText: "Your Wallet Password",
                      //   prefixIcon: Icons.wallet,
                      //   controller: controllerPass,
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                            width: 210,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                print(controllerIncome);
                                print(controllerPass);
                                BlocProvider.of<CreateWalletCubit>(context)
                                    .CreateWallet(
                                  context: context,
                                  total_income: controllerIncome.text,
                                  wallet_password: controllerPass.text,
                                );

                                // Navigator.pushReplacementNamed(
                                //     context, createwalletSuccess.id);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 51, 86, 116)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ))),
                              child: const Text(
                                " Creat Wallet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
