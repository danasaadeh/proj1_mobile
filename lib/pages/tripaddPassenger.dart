import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_state.dart';
import 'package:tourism/pages/tripBooking.dart';
import 'package:tourism/widget/city_drop_down.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class tripaddPassenger extends StatelessWidget {
  static String id = "booking";
  //final int? passengersCount;
  final int tripId;
  //final Function(PassengerData) onPassengerAdded;
  final textFieldKey = GlobalKey();
  tripaddPassenger(
      {
      //   this.passengersCount,
      // required this.onPassengerAdded,
      required this.tripId});

  final GlobalKey<FormState> keytrips = GlobalKey<FormState>();

  String? _GivenName;

  String? _LastName;

  String? _Country;

  DateTime? Date;
  String? selectedCity;
  bool _isPassengerChecked = false;

  void _addPassenger() {
    // if (keytrips.currentState!.validate()) {
    //   keytrips.currentState!.save();

    PassengerData passengerData = PassengerData(
      name: _givenNameController.text,
      lastname: _lastNameController.text,
      country: selectedCity,
      date: _dateController.text,
      isChecked: _isPassengerChecked,
    );

    //  onPassengerAdded(passengerData);

    //  Navigator.pop(context);
    // }
  }

  final TextEditingController _givenNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddPassengerCubit>(context).getFilters();
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: BlocConsumer<AddPassengerCubit, AddPassengerState>(
        listener: (context, state) {
          if (state is AddPassengerSuccess) {
            // Handle success state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            print(state.add_pass.id);
            //_addPassenger();
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                //  return tripBooking(idPass: state.add_pass.id);
                return tripBooking(
                  data: state.add_pass,
                  tripId: tripId,
                );
              },
            ));
            //Navigator.pushNamed(context, tripBooking.id);
          } else if (state is AddPassengerFailure) {
            // Handle failure state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AddPassengerLoading) {
            // Show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Add Passenger",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF1B4158)),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your name';
                            }
                            return null;
                          },
                          controller: _givenNameController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: "First name",
                            prefixIcon: Icon(Icons.person),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0XFF1B4158),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0XFF1B4158),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: _lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter your last name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: "Last name",
                          prefixIcon: Icon(Icons.person),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 500,
                      height: 70,
                      // height: 0,
                      margin: const EdgeInsets.all(10),
                      child: TextField(
                        //key: textFieldKey,
                        controller: _dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 17),
                          labelText: "Birth Date",
                          prefixIcon: Icon(Icons.today),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0XFF1B4158),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onTap: () async {
                          DateTime? result = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (result != null) {
                            //setState(() {
                            Date = result;
                            _dateController.text =
                                Date!.toIso8601String().split('T').first;
                            // });
                          }
                        },
                      ),
                    ),

                    Container(
                      width: 500,
                      height: 100,
                      child: DropDown(
                        onChanged: (value) {
                          selectedCity = value;
                        },
                        title: 'City',
                        hint: 'Select a city',
                        isdropSelected: true,
                        dataList:
                            BlocProvider.of<AddPassengerCubit>(context).cities,
                        selectedValue: selectedCity,
                      ),
                    ),
                    /*CustomTextField(
                                  controller: ,
                                  labelText: "First Name",
                                  prefixIcon: Icons.person,
                                  validationMessage: "Please Enter The First Name",
                                ),*/
                    /* SizedBox(
                                  height: 15,
                                ),
                                CustomTextField(
                                  controller: ,
                                  labelText: "Last Name",
                                  prefixIcon: Icons.person,
                                  validationMessage: "Please Enter The Last Name",
                                ),
                                SizedBox(
                                  height: 15,
                                ),*/
                    /* CustomTextField(
                                  labelText: "Country",
                                  prefixIcon: Icons.location_on,
                                  validationMessage: "Please Enter The Country",
                                ),*/
                    // SizedBox(
                    //   height: 15,
                    // ),
                    /* CustomTextField(
                                  labelText: "Date of Birth",
                                  prefixIcon: Icons.date_range,
                                  validationMessage: "Please Enter The Birth Date",
                                ),*/
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                          width: 210,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<AddPassengerCubit>(context)
                                  .AddTripPassenger(
                                      given_name: _givenNameController.text,
                                      last_name: _lastNameController.text,
                                      date_of_birth: _dateController.text,
                                      // TextEditingController(
                                      //         text: Date?.toIso8601String())
                                      //     .text,
                                      //'2020-4-5',
                                      city_id: selectedCity!
                                      //selectedCity!,
                                      );
                            },
                            //_addPassenger,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 51, 86, 116)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ))),
                            child: const Text(
                              "Add Passenger",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PassengerData {
  String? name;
  String? idNumber;
  String? lastname;
  String? country;
  String? date;

  bool isChecked = false;

  PassengerData(
      {this.name,
      this.idNumber,
      this.country,
      this.date,
      this.lastname,
      required this.isChecked});
}
