import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_cubit.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_state.dart';

import 'package:tourism/model/user.dart';
import 'package:tourism/pages/profile.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:tourism/widget/gender_drop_down.dart';
import 'package:tourism/widget/nationality_drop_down.dart';

class editProfile extends StatelessWidget {
  // final User user;
  static String id = "edit";
  final TextEditingController _controlleName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  List<Gender>? gender = [
    Gender(id: 0, name: 'Female'),
    Gender(id: 1, name: 'Male'),
  ];

  String? name;

  String? email;

  String? phone;

  String? age;
  // List<Nationality>? nationality = [
  //   Nationality(id: 0, name: 'Female'),
  //   Nationality(id: 1, name: 'Male'),
  // ];
  String? selectedGender;
  String? selectedNationality;

  editProfile({
    super.key,
    //required this.user
  });
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                height: 25,
              ),
              BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileFailure) {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              content: Text(state.message.toString()),
                            )));
                  }
                  if (state is UpdateProfileSuccess) {
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
                    Navigator.pushNamed(context, profilePage.id);

                    //_formKey.currentState?.reset();
                  }
                },
                builder: (context, state) {
                  if (state is UpdateProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Column(
                    children: [
                      TextFormField(
                        initialValue: user.name,
                        //controller: _controllerCompanyName,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Name',
                          // hintText: data[0].hotelName
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a  name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      // CustomTextField(
                      //   labelText: "Full Name",
                      //   prefixIcon: Icons.person,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        initialValue: user.email,
                        //controller: _controllerCompanyName,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Email',
                          // hintText: data[0].hotelName
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        initialValue: user.phone,
                        //controller: _controllerCompanyName,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Phone',
                          // hintText: data[0].hotelName
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          phone = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: user.age,
                        //controller: _controllerCompanyName,
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.blue),
                          labelText: 'Age',
                          // hintText: data[0].hotelName
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          age = value;
                        },
                      ),
                      Container(
                        width: 400,
                        height: 70,
                        child: NationalityDropDown(
                          onChanged: (value) {
                            selectedNationality = value;
                          },
                          hint: user.nationality.nation,
                          isdropSelected: true,
                          dataList:
                              BlocProvider.of<UpdateProfileCubit>(context).nat,
                          selectedValue: selectedNationality,
                        ),
                      ),
                      /*const CustomTextField(
                              labelText: "Nationality",
                              prefixIcon: Icons.flag,
                            ),*/
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 400,
                        height: 70,
                        child: GenderDropDown(
                          onChanged: (value) {
                            selectedGender = value;
                          },
                          hint: user.gender_id == 1 ? 'Male' : 'Female',
                          isdropSelected: true,
                          dataList: gender,
                          selectedValue: selectedGender,
                        ),
                      ),

                      /*const CustomTextField(
                              labelText: "",
                              prefixIcon: Icons.person_2,
                            ),*/
                      const SizedBox(
                        height: 10,
                      ),
                      // const CustomTextField(
                      //   labelText: "Birth Date",
                      //   prefixIcon: Icons.date_range,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // const CustomTextField(
                      //   labelText: "Email",
                      //   prefixIcon: Icons.email,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // const CustomTextField(
                      //   labelText: "Phone Number",
                      //   prefixIcon: Icons.phone,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Center(
                        child: SizedBox(
                            width: 210,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<UpdateProfileCubit>(context)
                                    .UpdateProfile(
                                        name: name == null ? user.name : name!,
                                        email:
                                            email == null ? user.email : email!,
                                        phone:
                                            phone == null ? user.phone : phone!,
                                        age: age == null ? user.age : age!,
                                        gender_id: selectedGender == null
                                            ? user.gender_id.toString()
                                            : selectedGender!,
                                        nationality: selectedNationality == null
                                            ? user.nationality.nation
                                            : selectedNationality!);

                                // print(selectedGender);
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
                                " Save Edits",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            )),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
