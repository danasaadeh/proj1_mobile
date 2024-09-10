import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/hotels/reserv/cubit/reserv_room_cubit.dart';
import 'package:tourism/Features/hotels/reserv/cubit/reserv_room_state.dart';
import 'package:tourism/Features/hotels/show_room_details/cubit/show_room_details_cubit.dart';
import 'package:tourism/Features/hotels/show_room_details/cubit/show_room_details_state.dart';
import 'package:tourism/pages/roombooking.dart';
import 'package:tourism/widget/customTextFiled.dart';

class RoomDetailsPage extends StatelessWidget {
  static String id = "roomdetails";
  final int roomId;
  final ScrollController controller = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerInDate = TextEditingController();
  final TextEditingController _controllerOutDate = TextEditingController();
  final TextEditingController _controllerPhoneNum = TextEditingController();
  final TextEditingController _controllerWalletPass = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  DateTime? Date;
  DateTime? Date2;

  RoomDetailsPage({super.key, required this.roomId});
  // final String price, image, name, description, sleeps, beds;
  // final List<String> pictures;
  // final List<String> fetuers;

  // RoomDetails(
  //     {super.key,
  //     required this.price,
  //     required this.image,
  //     required this.name,
  //     required this.description,
  //     required this.sleeps,
  //     required this.beds,
  //     required this.pictures,
  //     required this.fetuers});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShowRoomDetailsCubit>(context).getRoomDetails(roomId);
    double itemWidth = MediaQuery.of(context).size.width;
    double itemHeight = 300;

    return BlocBuilder<ShowRoomDetailsCubit, ShowRoomDetailsState>(
      builder: (context, state) {
        if (state is ShowRoomDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShowRoomDetailsFailure) {
          return Center(
              child: Container(
            child: Text(state.message.toString()),
          ));
        }
        if (state is ShowRoomDetailsEmpty) {
          return Center(
              child: Container(
            child: Text('Empty'),
          ));
        }
        if (state is ShowRoomDetailsSuccess) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: itemHeight,
                        width: itemWidth,
                        child: ListView.builder(
                          controller: controller,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.roomDetails.roomPhotos.length,
                          //pictures.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: itemWidth,
                              child: Image.network(
                                  state.roomDetails.roomPhotos[index].roomPhoto
                                  // pictures[index]
                                  ,
                                  fit: BoxFit.cover),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 8,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Colors.white),
                            onPressed: () {
                              controller.animateTo(
                                controller.offset - itemWidth,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 8,
                        child: Center(
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onPressed: () {
                              controller.animateTo(
                                controller.offset + itemWidth,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(18),
                    height: 470,
                    color: Colors.white,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.roomDetails.roomType,
                            //name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color(0XFF1B4158)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 209, 201, 201)),
                              children: state.roomDetails.roomDetails
                                  .split('\n')
                                  .map((line) {
                                return TextSpan(
                                  text: line,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color:
                                          Color.fromARGB(255, 104, 101, 101)),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.bed,
                                color: Color(0XFF1B4158),
                              ),
                              Text(
                                state.roomDetails.roomBeds.toString(),
                                // beds,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 104, 101, 101)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.person,
                                color: Color(0XFF1B4158),
                              ),
                              Text(
                                state.roomDetails.roomSleeps.toString(),
                                // sleeps,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 104, 101, 101)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Column(
                            children: List.generate(
                              state.roomDetails.roomFeatures.length,
                              // fetuers.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color(0XFF1B4158),
                                      size: 18,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      state.roomDetails.roomFeatures[index]
                                          .roomFeature,
                                      //fetuers[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 104, 101, 101)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Price for night:  ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF1B4158)),
                                ),
                                Text(
                                  state.roomDetails.roomPrice + "\$",
                                  // price,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF1B4158)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                                width: 210,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom,
                                          ),
                                          child: BlocConsumer<ReservRoomCubit,
                                              ReservRoomState>(
                                            listener: (context, state2) {
                                              if (state2 is ReservRoomSuccess) {
                                                // Handle success state
                                                Navigator.pop(context);
                                                // Navigator.pushNamed(
                                                //     context, RoomBooking.id);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        Text(state2.message),
                                                  ),
                                                );
                                              } else if (state2
                                                  is ReservRoomFailure) {
                                                // Handle failure state
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content:
                                                        Text(state2.message),
                                                  ),
                                                );
                                              }
                                            },
                                            builder: (context, state2) {
                                              if (state2 is ReservRoomLoading) {
                                                // Show a loading indicator
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: Form(
                                                  key: _formKey,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        const Text(
                                                          'Booking your Room',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0XFF1B4158)),
                                                        ),
                                                        const SizedBox(
                                                            height: 25),
                                                        TextFormField(
                                                          controller:
                                                              _controllerName,
                                                          cursorColor:
                                                              Colors.blue,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        17),
                                                            labelText:
                                                                "full name",
                                                            prefixIcon: Icon(
                                                                Icons.person),
                                                            labelStyle:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter a  name';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            //name = value;
                                                          },
                                                        ),
                                                        /* const CustomTextField(
                                                            labelText:
                                                                "Full Name",
                                                            prefixIcon:
                                                                Icons.person,
                                                            validationMessage:
                                                                "Please Enter Your Full Name"),*/
                                                        const SizedBox(
                                                          height: 18,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              _controllerPhoneNum,
                                                          cursorColor:
                                                              Colors.blue,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        17),
                                                            labelText:
                                                                "Phone number",
                                                            prefixIcon: Icon(
                                                                Icons.phone),
                                                            labelStyle:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter a phone num';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            //  name = value;
                                                          },
                                                        ),
                                                        /* const CustomTextField(
                                                          labelText:
                                                              "Phone Number",
                                                          prefixIcon:
                                                              Icons.phone,
                                                          validationMessage:
                                                              "Please Enter Your Number",
                                                          keyboardType:
                                                              TextInputType
                                                                  .phone,
                                                        ),*/
                                                        const SizedBox(
                                                          height: 16,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Flexible(
                                                              flex: 4,
                                                              child: TextField(
                                                                //key: textFieldKey,
                                                                controller:
                                                                    _controllerInDate,
                                                                readOnly: true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          17),
                                                                  labelText:
                                                                      "In Date",
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .today),
                                                                  labelStyle:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0XFF1B4158),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0XFF1B4158),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                ),
                                                                onTap:
                                                                    () async {
                                                                  DateTime?
                                                                      result =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2000),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100),
                                                                  );
                                                                  if (result !=
                                                                      null) {
                                                                    //setState(() {
                                                                    Date =
                                                                        result;
                                                                    _controllerInDate.text = Date!
                                                                        .toIso8601String()
                                                                        .split(
                                                                            'T')
                                                                        .first;
                                                                    // });
                                                                  }
                                                                },
                                                              ),
                                                              /*CustomTextField(
                                                                  labelText:
                                                                      "In Date",
                                                                  prefixIcon: Icons
                                                                      .calendar_month,
                                                                  validationMessage:
                                                                      "Please Enter Your In Date",
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .datetime,
                                                                )*/
                                                            ),
                                                            SizedBox(
                                                              width: 7,
                                                            ),
                                                            Flexible(
                                                              flex: 4,
                                                              child: TextField(
                                                                //key: textFieldKey,
                                                                controller:
                                                                    _controllerOutDate,
                                                                readOnly: true,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15,
                                                                      vertical:
                                                                          17),
                                                                  labelText:
                                                                      "Out date",
                                                                  prefixIcon:
                                                                      Icon(Icons
                                                                          .today),
                                                                  labelStyle:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0XFF1B4158),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0XFF1B4158),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25),
                                                                  ),
                                                                ),
                                                                onTap:
                                                                    () async {
                                                                  DateTime?
                                                                      result =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            2000),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100),
                                                                  );
                                                                  if (result !=
                                                                      null) {
                                                                    //setState(() {
                                                                    Date2 =
                                                                        result;
                                                                    _controllerOutDate.text = Date2!
                                                                        .toIso8601String()
                                                                        .split(
                                                                            'T')
                                                                        .first;
                                                                    // });
                                                                  }
                                                                },
                                                              ),
                                                              /* CustomTextField(
                                                                  labelText:
                                                                      "Out Date",
                                                                  prefixIcon: Icons
                                                                      .calendar_month,
                                                                  validationMessage:
                                                                      "Please Enter Your Out Date",
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .datetime,
                                                                )*/
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              _controllerWalletPass,
                                                          cursorColor:
                                                              Colors.blue,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        15,
                                                                    vertical:
                                                                        17),
                                                            labelText:
                                                                "Wallet Password",
                                                            prefixIcon: Icon(
                                                                Icons.wallet),
                                                            labelStyle:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter a  name';
                                                            }
                                                            return null;
                                                          },
                                                          onChanged: (value) {
                                                            // name = value;
                                                          },
                                                        ),
                                                        /*const CustomTextField(
                                                          labelText:
                                                              "Wallet password",
                                                          prefixIcon:
                                                              Icons.wallet,
                                                          validationMessage:
                                                              "Please Enter Your Wallet password",
                                                        ),*/
                                                        const SizedBox(
                                                            height: 16),
                                                        const Text(
                                                          'When confirming your booking, 50% of the price will be deducted.',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        Text(
                                                          state.roomDetails
                                                                  .roomPrice +
                                                              "\$",
                                                          //  price,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0XFF1B4158)),
                                                        ),
                                                        const SizedBox(
                                                            height: 16),
                                                        SizedBox(
                                                          height: 50,
                                                          width: 210,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              if (_formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                BlocProvider.of<ReservRoomCubit>(context).ReservRoom(
                                                                    phone_num:
                                                                        _controllerPhoneNum
                                                                            .text,
                                                                    full_name:
                                                                        _controllerName
                                                                            .text,
                                                                    from_day:
                                                                        _controllerInDate
                                                                            .text,
                                                                    to_day:
                                                                        _controllerOutDate
                                                                            .text,
                                                                    wallet_pass:
                                                                        _controllerWalletPass
                                                                            .text,
                                                                    id: roomId);

                                                                // Navigator.pushNamed(
                                                                //     context,
                                                                //     RoomBooking
                                                                //         .id);
                                                              }
                                                            },
                                                            style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all<
                                                                          Color>(
                                                                const Color(
                                                                    0XFF1B4158),
                                                              ),
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              35),
                                                                ),
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Confirm Booking',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0XFF1B4158)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35),
                                      ))),
                                  child: const Text(
                                    "Booking",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));
        } else {
          return Center(
            child: Text("Something went wrong please try again"),
          );
        }
      },
    );
  }
}
