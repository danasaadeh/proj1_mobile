import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_cubit.dart';
import 'package:tourism/Features/hotels/search/cubit/search_cubit.dart';
import 'package:tourism/Features/hotels/search/cubit/search_state.dart';
import 'package:tourism/pages/hotels.dart';
import 'package:tourism/widget/city_drop_down.dart';
import 'package:tourism/widget/customTextFiled.dart';
import 'package:tourism/widget/customscaffold.dart';

class hotelSearch extends StatelessWidget {
  static String id = "hotels";
  final GlobalKey<FormState> keyhotel = GlobalKey<FormState>();
  final TextEditingController _controlleLoca = TextEditingController();
  final TextEditingController _controllerInDate = TextEditingController();
  final TextEditingController _controllerOutDate = TextEditingController();
  final TextEditingController _controllerRate = TextEditingController();
  final TextEditingController _controllerPersonNum = TextEditingController();
  final TextEditingController _controllerRoomNum = TextEditingController();
  DateTime? Date;
  DateTime? Date2;
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchHotelCubit>(context).getFilters();
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: BlocConsumer<SearchHotelCubit, SearchHotelState>(
        listener: (context, state) {
          if (state is SearchHotelSuccess) {
            // Handle success state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return hotelPage(data: state.hotels);
              },
            ));
          } else if (state is SearchHotelEmpty) {
            // Handle failure state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SearchHotelFailure) {
            // Handle failure state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SearchHotelLoading) {
            // Show a loading indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Form(
                key: keyhotel,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      "Find Your Best Stay",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF1B4158)),
                    ),
                    const SizedBox(
                      height: 25,
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
                            BlocProvider.of<SearchHotelCubit>(context).cities,
                        selectedValue: selectedCity,
                      ),
                    ),
                    /* Container(
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
                          controller: _controlleLoca,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: "Location",
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
                    ),*/
                    /*CustomTextField(
                        labelText: "Location",
                        prefixIcon: Icons.location_on,
                        validationMessage: "Please Enter The Location",
                      ),*/
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: TextField(
                            //key: textFieldKey,
                            controller: _controllerInDate,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 17),
                              labelText: "In Date:",
                              prefixIcon: const Icon(Icons.date_range),
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
                                _controllerInDate.text =
                                    Date!.toIso8601String().split('T').first;
                                // });
                              }
                            },
                          ),

                          /*CustomTextField(
                                labelText: "In Date",
                                prefixIcon: Icons.calendar_month,
                                validationMessage: "Please Enter Your In Date",
                                keyboardType: TextInputType.datetime,
                              )*/
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          flex: 4,
                          child: TextField(
                            //key: textFieldKey,
                            controller: _controllerOutDate,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 17),
                              labelText: "Out Date:",
                              prefixIcon: const Icon(Icons.date_range),
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
                                Date2 = result;
                                _controllerOutDate.text =
                                    Date2!.toIso8601String().split('T').first;
                                // });
                              }
                            },
                          ),
                          /* CustomTextField(
                                labelText: "Out Date",
                                prefixIcon: Icons.calendar_month,
                                validationMessage: "Please Enter Your Out Date",
                                keyboardType: TextInputType.datetime,
                              )*/
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your rate';
                            }
                            return null;
                          },
                          controller: _controllerRate,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 17),
                            labelText: "Rate",
                            prefixIcon: const Icon(Icons.star),
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
                    /* CustomTextField(
                        labelText: "Rate",
                        prefixIcon: Icons.star,
                        keyboardType: TextInputType.number,
                      ),*/
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
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
                                controller: _controllerPersonNum,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 17),
                                  labelText: "Person Num",
                                  prefixIcon: const Icon(Icons.person),
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
                          /* CustomTextField(
                                labelText: "persons number",
                                prefixIcon: Icons.person_2,
                                keyboardType: TextInputType.number,
                              )*/
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
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
                                controller: _controllerRoomNum,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 17),
                                  labelText: "Room Num",
                                  prefixIcon: const Icon(Icons.person),
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
                          /*CustomTextField(
                                labelText: "Room number",
                                prefixIcon: Icons.home,
                                keyboardType: TextInputType.number,
                              )*/
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: SizedBox(
                          width: 210,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SearchHotelCubit>(context)
                                  .SearchHotel(
                                      city_id: selectedCity!,
                                      in_date: _controllerInDate.text,
                                      out_date: _controllerOutDate.text,
                                      room_num: _controllerRoomNum.text,
                                      person_num: _controllerPersonNum.text,
                                      rate: _controllerRate.text);
                              //   if (keyhotel.currentState?.validate() ?? false) {

                              // }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0XFF1B4158)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                            child: const Text(
                              "Search",
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
