import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/wallet/show_card/cubit/show_card_cubit.dart';
import 'package:tourism/Features/wallet/show_card/cubit/show_card_state.dart';
import 'package:tourism/Features/wallet/show_wallet/cubit/show_wallet_cubit.dart';
import 'package:tourism/Features/wallet/show_wallet/cubit/show_wallet_state.dart';
import 'package:tourism/pages/profile.dart';

import 'package:tourism/widget/wallet_table.dart';

class walletPage extends StatelessWidget {
  List<Map<String, dynamic>> activites = [
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "hotel",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.remove
    },
    {
      "activity": "trip",
      "price": "\$7455",
      "date": "12/9/2024",
      "icon": Icons.remove
    },
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "trip",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
    {
      "activity": "flight",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.remove
    },
    {
      "activity": "hotel",
      "price": "\$3455",
      "date": "12/3/2024",
      "icon": Icons.add
    },
  ];
  static String id = "wallet";
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowCardCubit>(context).getIncome();
    BlocProvider.of<WalletCubit>(context).getWalletData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 51, 86, 116),
        title: const Text(
          "My Wallet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, profilePage.id);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 51, 86, 116),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Total Encom",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: BlocBuilder<ShowCardCubit, ShowCardState>(
                                builder: (context, state) {
                                  if (state is ShowCardLoading) {
                                    return CircularProgressIndicator();
                                  } else if (state is ShowCardFailure) {
                                    return Container(
                                      child: Text(state.message.toString()),
                                    );
                                  } else if (state is ShowCardSuccess) {
                                    return Text(
                                      "\$" + state.card.income.toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      child: Text('Empty'),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(170),
                        ),
                        child: Container(
                          width: 150,
                          height: 150,
                          color: const Color.fromARGB(255, 197, 197, 197),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 10),
                            child: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Activites:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 51, 86, 116)),
                ),
                const SizedBox(
                  height: 20,
                ),
                //  WalletTable(),
                BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                    if (state is WalletLoading) {
                      return CircularProgressIndicator();
                    } else if (state is WalletFailure) {
                      return Container(
                        child: Text(state.message.toString()),
                      );
                    } else if (state is WalletEmpty) {
                      return Center(
                        child: Card(
                          elevation: 2,
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            child: Text(
                              'There is no Activities Found',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    } else if (state is WalletSuccess) {
                      return WalletTable(data: state.activ);
                    } else {
                      return Container(
                        child: Text('Something went wrong'),
                      );
                    }
                  },
                ),
                /* Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: 400,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey), // إضافة حدود بلون رمادي
                    borderRadius: BorderRadius.circular(30), // تدوير الحواف
                  ),
                  child: ListView.builder(
                    itemCount: activites.length,
                    itemBuilder: (BuildContext context, int index) {
                      IconData icon = activites[index]['icon'];
                      Color iconColor =
                          Colors.green; // اللون الافتراضي للأيقونة
                      Color priceColor = Colors.green; // اللون الافتراضي للسعر

                      if (icon == Icons.remove) {
                        iconColor = Colors.red; // تغيير لون الأيقونة إلى الأحمر
                        priceColor = Colors.red; // تغيير لون السعر إلى الأحمر
                      }

                      return Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                icon,
                                color: iconColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['activity'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 51, 86, 116)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['date'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                activites[index]['price'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: priceColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    },
                  ),
                )*/
              ],
            )),
      ),
    );
  }
}
