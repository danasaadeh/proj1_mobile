import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/flights/passenger/update/cubit/update_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/update/cubit/update_flight_passenger_state.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_cubit.dart';
import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/widget/city_drop_down.dart';
import 'package:tourism/widget/customscaffold.dart';

class UpdateFlightPassenger extends StatelessWidget {
  static String id = "booking";
  // final int? passengersCount;
  // final Function(PassengerData) onPassengerAdded;
  final textFieldKey = GlobalKey();
  UpdateFlightPassenger(
      {
      // this.passengersCount, required this.onPassengerAdded,
      required this.data});
  final GlobalKey<FormState> keytrips = GlobalKey<FormState>();
  String? _GivenName;
  String? _LastName;
  String? _Country;
  DateTime? Date;
  String? selectedCity;
  final AddPassenger data;
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
    // onPassengerAdded(passengerData);
    //  Navigator.pop(context);
    // }
  }

  final TextEditingController _givenNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpdateFlightPassengerCubit>(context).getFilters();
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child:
          BlocConsumer<UpdateFlightPassengerCubit, UpdateFlightPassengerState>(
        listener: (context, state) {
          if (state is UpdateFlightPassengerSuccess) {
            // Handle success state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                //  return tripBooking(idPass: state.add_pass.id);
                return Personal_Info(
                  data: data,
                  flightId: data.id,
                  flightData:
                      BlocProvider.of<ShowFlightDetailsCubit>(context).flight!,
                );
              },
            ));

            //Navigator.pushNamed(context, tripBooking.id);
          } else if (state is UpdateFlightPassengerFailure) {
            // Handle failure state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UpdateFlightPassengerLoading) {
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
                      "Edit Passenger",
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
                          initialValue: data.givenName,
                          onChanged: (value) {
                            _GivenName = value!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your name';
                            }
                            return null;
                          },
                          // controller: _givenNameController,
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
                        initialValue: data.lastName,
                        onChanged: (value) {
                          _LastName = value!;
                        },
                        // controller: _lastNameController,
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
                          labelText: data.dateOfBirth,
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
                        hint: data.city.cityName,
                        isdropSelected: true,
                        dataList:
                            BlocProvider.of<UpdateFlightPassengerCubit>(context)
                                .cities,
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
                              print(_GivenName);
                              print(_LastName);
                              print(_dateController.text);
                              print(selectedCity);
                              print(data.id);
                              BlocProvider.of<UpdateFlightPassengerCubit>(
                                      context)
                                  .EditFlightPassenger(
                                      id: data.id,
                                      given_name: _GivenName == null
                                          ? data.givenName
                                          : _GivenName!,
                                      last_name: _LastName == null
                                          ? data.lastName
                                          : _LastName!,
                                      date_of_birth:
                                          _dateController.text == null
                                              ? data.dateOfBirth
                                              : _dateController.text,
                                      // TextEditingController(
                                      //         text: Date?.toIso8601String())
                                      //     .text,
                                      //'2020-4-5',
                                      city_id: selectedCity == null
                                          ? data.city.id.toString()
                                          : selectedCity!
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
                              "Edit Passenger",
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
