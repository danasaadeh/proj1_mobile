import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Auth/logout_cubit.dart';
import 'package:tourism/Features/profile/show_profile/cubit/show_profile_cubit.dart';
import 'package:tourism/Features/profile/show_profile/cubit/show_profile_state.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_cubit.dart';
import 'package:tourism/pages/create_wallet.dart';
import 'package:tourism/pages/edit_Profile.dart';
import 'package:tourism/pages/login%20-%20Copy.dart';
import 'package:tourism/pages/wallet_page.dart';
import 'package:tourism/widget/LogoutDialog.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:tourism/widget/profile_card.dart';

class profilePage extends StatelessWidget {
  static String id = "profile";
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowProfileCubit>(context).ShowProfile();
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 70,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 51, 86, 116),
                    size: 70,
                  ),
                ),
              )),
              const SizedBox(
                height: 7,
              ),
              BlocBuilder<ShowProfileCubit, ShowProfileState>(
                builder: (context, state) {
                  if (state is ShowProfileLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ShowProfileEmpty) {
                    return Container(
                      child: Text('There is no profile data'),
                    );
                  } else if (state is ShowProfileFailure) {
                    return Container(
                      child: Text('Failureeee'),
                    );
                  } else if (state is ShowProfileSuccess) {
                    return Column(
                      children: [
                        ProfileCard(info: state.user.name, icon: Icons.person),
                        ProfileCard(info: state.user.email, icon: Icons.email),
                        ProfileCard(info: state.user.phone, icon: Icons.phone),
                        ProfileCard(
                            info: state.user.age, icon: Icons.date_range),
                        ProfileCard(
                            info: state.user.nationality.nation,
                            icon: Icons.flag),
                        ProfileCard(
                            info: state.user.gender_id == 1 ? 'Male' : 'Female',
                            icon: Icons.person_2),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 53,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // BlocProvider.of<ShowProfileCubit>(context)
                                    //     .ShowProfile();
                                    print(state.user.wallet);
                                    if (state.user.wallet == true) {
                                      // BlocProvider.of<ShowProfileCubit>(context)
                                      //     .ShowProfile();
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return walletPage();
                                        },
                                      ));
                                    } else {
                                      // BlocProvider.of<ShowProfileCubit>(context)
                                      //     .ShowProfile();
                                      Navigator.pushNamed(
                                          context, creatWallet.id);
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  178, 158, 158, 158)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.attach_money,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Wallet",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                                width: 150,
                                height: 53,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return LogoutDialog();
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  178, 158, 158, 158)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.logout_rounded,
                                        size: 25,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 53,
                                child: ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<UpdateProfileCubit>(context)
                                        .getFilters();
                                    Navigator.pushNamed(context, editProfile.id,
                                        arguments: state.user);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 51, 86, 116)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ))),
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                            SizedBox(
                                width: 150,
                                height: 53,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Delete your Account',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF064061),
                                                  fontSize: 18,
                                                  fontFamily: "DancingScript"),
                                              textAlign: TextAlign.center,
                                            ),
                                            content: Text(
                                                'Are you sure you want to delete you profile?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.blue),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              ShowProfileCubit>(
                                                          context)
                                                      .deleteProfile();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      width: 200,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .secondary,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      content: Text(
                                                          'profile deleted sucessfully and if you have a reservation after 5 days from this date or more , 30% of the amount you paid for this reservation will be refunded to you'),
                                                    ),
                                                  );
                                                  Navigator.pushNamed(
                                                      context, LoginPage.id);
                                                },
                                                child: Text('Delete',
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 51, 86, 116)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ))),
                                  child: const Text(
                                    "Delete Profile",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      child: Text('There is something went wrong'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
