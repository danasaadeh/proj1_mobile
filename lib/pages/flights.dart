import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/flights/search_flight/cubit/search_flight_cubit.dart';
import 'package:tourism/Features/flights/search_flight/cubit/search_flight_state.dart';
import 'package:tourism/model/search_flight_model.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/pages/round_way.dart';
import 'package:tourism/widget/city_drop_down.dart';
import 'package:tourism/widget/customscaffold.dart';
import 'package:tourism/widget/flight_class_drop_down.dart';

class FlightPage extends StatelessWidget {
  static String id = "flights";

  String? selectedfCity;
  String? selectedtCity;
  DateTime? Date;
  DateTime? Date2;
  final TextEditingController _controllerInDate = TextEditingController();
  final TextEditingController _controllerOutDate = TextEditingController();
  final TextEditingController _controllerPassenger = TextEditingController();
  String? selectedClass;
  List<FlightClass>? classes = [
    FlightClass(id: 1, name: 'Economy'),
    FlightClass(id: 2, name: 'First'),
    FlightClass(id: 3, name: 'Business'),
  ];

  String? selectedfCity2;
  String? selectedtCity2;
  DateTime? _Date;
  DateTime? _Date2;
  final TextEditingController _controllerInDate2 = TextEditingController();
  final TextEditingController _controllerOutDate2 = TextEditingController();
  final TextEditingController _controllerPassenger2 = TextEditingController();
  String? selectedClass2;
  List<FlightClass>? classes2 = [
    FlightClass(id: 1, name: 'Economy'),
    FlightClass(id: 2, name: 'First'),
    FlightClass(id: 3, name: 'Business'),
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchFlightCubit>(context).getFilters();
    return CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.1, horizontal: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 500),
                        child: Container(
                            height: 0.1,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Homepage.id);
                                },
                                icon: Icon(
                                  Icons.navigate_before,
                                  size: 45,
                                  color: Color(0XFF1B4158),
                                ))),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text(" Book your \n       Flight..",
                            style: TextStyle(
                                color: Color(0XFF1B4158),
                                fontWeight: FontWeight.bold,
                                fontSize: 33)),
                      ),
                      SizedBox(
                        height: 0.0001,
                      ),
                      DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40),
                              child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: TabBar(
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicator: BoxDecoration(
                                        color: Color(0XFF1B4158),
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      labelColor: Colors.white,
                                      unselectedLabelColor: Colors.black,
                                      tabs: const [
                                        Tab(
                                          child: Text(
                                            'Round Trip',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            'One Way',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 19),
                                          ),
                                        ),
                                      ])),
                            ),
                            SizedBox(
                              height: 400,
                              child: TabBarView(children: [
                                BlocConsumer<SearchFlightCubit,
                                    SearchFlightState>(
                                  listener: (context, state) {
                                    if (state is SearchFlightRoundSuccess) {
                                      // Handle success state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Round_way(
                                            dataDepart:
                                                state.departFlights != []
                                                    ? state.departFlights
                                                    : [],
                                            dataReturn:
                                                state.returnFlights != []
                                                    ? state.returnFlights
                                                    : [],
                                          );
                                        },
                                      ));
                                    } else if (state
                                        is SearchFlightRoundEmpty) {
                                      // Handle failure state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    } else if (state is SearchFlightFailure) {
                                      // Handle failure state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is SearchFlightLoading) {
                                      // Show a loading indicator
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    height: 110,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: DropDown(
                                                        onChanged: (value) {
                                                          selectedfCity = value;
                                                        },
                                                        title: 'From City',
                                                        hint: 'Select a city',
                                                        isdropSelected: true,
                                                        dataList: BlocProvider
                                                                .of<SearchFlightCubit>(
                                                                    context)
                                                            .cities,
                                                        selectedValue:
                                                            selectedfCity,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 110,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: DropDown(
                                                    onChanged: (value) {
                                                      selectedtCity = value;
                                                    },
                                                    title: 'To City',
                                                    hint: 'Select a city',
                                                    isdropSelected: true,
                                                    dataList: BlocProvider.of<
                                                                SearchFlightCubit>(
                                                            context)
                                                        .cities,
                                                    selectedValue:
                                                        selectedtCity,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 0.01,
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 150),
                                                    child: Text(
                                                      'Depart',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(
                                                      'Return',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.1),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 80,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: TextField(
                                                          //key: textFieldKey,
                                                          controller:
                                                              _controllerInDate,
                                                          readOnly: true,
                                                          decoration:
                                                              const InputDecoration(
                                                            filled: true,
                                                            labelStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                            labelText:
                                                                "Depart Date",
                                                            border: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide()),
                                                            suffixIcon: Icon(
                                                                Icons.today),
                                                          ),
                                                          onTap: () async {
                                                            DateTime? result =
                                                                await showDatePicker(
                                                              context: context,
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
                                                              Date = result;
                                                              _controllerInDate
                                                                      .text =
                                                                  Date!
                                                                      .toIso8601String()
                                                                      .split(
                                                                          'T')
                                                                      .first;
                                                              // });
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 80,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: TextField(
                                                          //key: textFieldKey,
                                                          controller:
                                                              _controllerOutDate,
                                                          readOnly: true,
                                                          decoration:
                                                              const InputDecoration(
                                                            filled: true,
                                                            labelStyle:
                                                                TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                            labelText:
                                                                "Return Date",
                                                            border: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide()),
                                                            suffixIcon: Icon(
                                                                Icons.today),
                                                          ),
                                                          onTap: () async {
                                                            DateTime? result =
                                                                await showDatePicker(
                                                              context: context,
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
                                                              Date2 = result;
                                                              _controllerOutDate
                                                                      .text =
                                                                  Date2!
                                                                      .toIso8601String()
                                                                      .split(
                                                                          'T')
                                                                      .first;
                                                              // });
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 100),
                                                    child: Text(
                                                      'Passengers',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    child: Text(
                                                      'Class',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFF1B4158),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 70,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: TextFormField(
                                                          controller:
                                                              _controllerPassenger,
                                                          decoration:
                                                              const InputDecoration(
                                                            fillColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    237,
                                                                    236,
                                                                    236),
                                                            filled: true,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20)),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0XFF1B4158),
                                                                  width:
                                                                      0.9999),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                              color: Color(
                                                                  0XFF1B4158),
                                                            )),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .digitsOnly
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: 90,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Container(
                                                          //  width: 400,
                                                          height: 120,
                                                          child: ClassDropDown(
                                                            onChanged: (value) {
                                                              selectedClass =
                                                                  value;
                                                            },
                                                            hint:
                                                                'Select a class',
                                                            isdropSelected:
                                                                true,
                                                            dataList: classes,
                                                            selectedValue:
                                                                selectedClass,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: 60,
                                                  width: 240,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ElevatedButton(
                                                        onPressed: () {
                                                          BlocProvider.of<
                                                                      SearchFlightCubit>(
                                                                  context)
                                                              .SearchRoundWayFlight(
                                                                  from_city:
                                                                      selectedfCity!,
                                                                  to_city:
                                                                      selectedtCity!,
                                                                  flight_class:
                                                                      selectedClass!,
                                                                  passengers:
                                                                      _controllerPassenger
                                                                          .text,
                                                                  depart_date:
                                                                      _controllerInDate
                                                                          .text,
                                                                  return_date:
                                                                      _controllerOutDate
                                                                          .text);

                                                          // Navigator
                                                          //     .pushReplacementNamed(
                                                          //         context,
                                                          //         ResultFlight.id);
                                                        },
                                                        child: const Text(
                                                          "Search Flight",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18,
                                                              height: 0.1),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                          backgroundColor:
                                                              Color(0XFF1B4158),
                                                          // padding: EdgeInsets.symmetric(horizontal: 5,vertical:2)
                                                        )),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )),
                                    );
                                  },
                                ),
                                BlocConsumer<SearchFlightCubit,
                                    SearchFlightState>(
                                  listener: (context, state) {
                                    if (state is SearchFlightSuccess) {
                                      // Handle success state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return ResultFlight(
                                              data: state.flights);
                                        },
                                      ));
                                      // Navigator.pushReplacementNamed(
                                      //     context, ResultFlight.id);
                                    } else if (state is SearchFlightEmpty) {
                                      // Handle failure state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    } else if (state is SearchFlightFailure) {
                                      // Handle failure state
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is SearchFlightLoading) {
                                      // Show a loading indicator
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return SingleChildScrollView(
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: DropDown(
                                                      onChanged: (value) {
                                                        selectedfCity2 = value;
                                                      },
                                                      title: 'From City',
                                                      hint: 'Select a city',
                                                      isdropSelected: true,
                                                      dataList: BlocProvider.of<
                                                                  SearchFlightCubit>(
                                                              context)
                                                          .cities,
                                                      selectedValue:
                                                          selectedfCity2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Container(
                                              height: 110,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: DropDown(
                                                  onChanged: (value) {
                                                    selectedtCity2 = value;
                                                  },
                                                  title: 'To City',
                                                  hint: 'Select a city',
                                                  isdropSelected: true,
                                                  dataList: BlocProvider.of<
                                                              SearchFlightCubit>(
                                                          context)
                                                      .cities,
                                                  selectedValue: selectedtCity2,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 0.01,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 120),
                                                  child: Text(
                                                    'Depart',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 0.1,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 75,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextField(
                                                        //key: textFieldKey,
                                                        controller:
                                                            _controllerInDate2,
                                                        readOnly: true,
                                                        decoration:
                                                            const InputDecoration(
                                                          filled: true,
                                                          labelStyle: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                          labelText:
                                                              "Depart Date",
                                                          border: OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide()),
                                                          suffixIcon:
                                                              Icon(Icons.today),
                                                        ),
                                                        onTap: () async {
                                                          DateTime? result =
                                                              await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2000),
                                                            lastDate:
                                                                DateTime(2100),
                                                          );
                                                          if (result != null) {
                                                            //setState(() {
                                                            _Date = result;
                                                            _controllerInDate2
                                                                    .text =
                                                                _Date!
                                                                    .toIso8601String()
                                                                    .split('T')
                                                                    .first;
                                                            // });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.1,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 90),
                                                  child: Text(
                                                    'Passengers',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 0.1,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Text(
                                                    'Class',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0XFF1B4158),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                SizedBox(height: 0.1),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 70,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextFormField(
                                                        controller:
                                                            _controllerPassenger2,
                                                        decoration:
                                                            const InputDecoration(
                                                          fillColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  237,
                                                                  236,
                                                                  236),
                                                          // labelText: 'passengers',
                                                          // labelStyle:TextStyle(color:  Color(0XFF1B4158),) ,
                                                          //  hintText: "passengers",
                                                          // hintStyle: TextStyle(color:  Color(0XFF1B4158),fontSize: 15),
                                                          filled: true,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            borderSide: BorderSide(
                                                                color: Color(
                                                                    0XFF1B4158),
                                                                width: 0.9999),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                            color: Color(
                                                                0XFF1B4158),
                                                          )),
                                                        ),
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 80,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(60)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: ClassDropDown(
                                                        onChanged: (value) {
                                                          selectedClass2 =
                                                              value;
                                                        },
                                                        hint: 'Select a class',
                                                        isdropSelected: true,
                                                        dataList: classes2,
                                                        selectedValue:
                                                            selectedClass2,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                height: 75,
                                                width: 240,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    SearchFlightCubit>(
                                                                context)
                                                            .SearchOneWayFlight(
                                                          from_city:
                                                              selectedfCity2!,
                                                          to_city:
                                                              selectedtCity2!,
                                                          flight_class:
                                                              selectedClass2!,
                                                          passengers:
                                                              _controllerPassenger2
                                                                  .text,
                                                          depart_date:
                                                              _controllerInDate2
                                                                  .text,
                                                        );
                                                      },
                                                      child: const Text(
                                                        "Search Flight",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            height: 0.1),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40)),
                                                        backgroundColor:
                                                            Color(0XFF1B4158),
                                                        // padding: EdgeInsets.symmetric(horizontal: 5,vertical:2)
                                                      )),
                                                )),
                                          ],
                                        ),
                                      )),
                                    );
                                  },
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
