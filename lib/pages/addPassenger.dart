import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/Features/flights/passenger/add/cubit/add_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/add/cubit/add_flight_passenger_state.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_cubit.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/widget/city_drop_down.dart';
import 'package:tourism/widget/customscaffold.dart';

class AddPassengersScreen extends StatelessWidget {
  static String id = "add";
  final int flightId;
  final int? passengersCount;
  final Function(PassengerData) onPassengerAdded;
  final textFieldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  void _AddFlightPassenger() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      PassengerData passengerData = PassengerData(
        name: _GivenName,
        lastname: _LastName,
        country: _Country,
        date: Date,
        isChecked: _isPassengerChecked,
      );

      //widget.onPassengerAdded(passengerData);

      // Navigator.pop(context);
    }
  }

  AddPassengersScreen(
      {this.passengersCount,
      required this.onPassengerAdded,
      required this.flightId});

  final GlobalKey<FormState> keytrips = GlobalKey<FormState>();

  String? _GivenName;

  String? _LastName;

  String? _Country;

  DateTime? Date;
  String? selectedCity;
  bool _isPassengerChecked = false;

  final TextEditingController _givenNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddFlightPassengerCubit>(context).getFilters();
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: BlocConsumer<AddFlightPassengerCubit, AddFlightPassengerState>(
        listener: (context, state) {
          if (state is AddFlightPassengerSuccess) {
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
                return Personal_Info(
                  data: state.add_pass,
                  flightId: flightId,
                  flightData:
                      BlocProvider.of<ShowFlightDetailsCubit>(context).flight!,
                );
              },
            ));
            //Navigator.pop(context);
            // Navigator.pushNamed(context, tripBooking.id);
          } else if (state is AddFlightPassengerFailure) {
            // Handle failure state
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AddFlightPassengerLoading) {
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
                          labelText: "Birth date",
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
                            BlocProvider.of<AddFlightPassengerCubit>(context)
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
                              BlocProvider.of<AddFlightPassengerCubit>(context)
                                  .AddFlightPassenger(
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
                            //_AddFlightPassenger,
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

/*class AddFlightPassengersScreen extends StatefulWidget {
    static String id = "add";
  final int? passengersCount;
  final Function(PassengerData) onPassengerAdded;

  AddFlightPassengersScreen({this.passengersCount, required this.onPassengerAdded});

  @override
  _AddFlightPassengersScreenState createState() => _AddFlightPassengersScreenState();
}

class _AddFlightPassengersScreenState extends State<AddFlightPassengersScreen> {
  final _formKey = GlobalKey<FormState>();
 

  
  String? _GivenName;
  String? _LastName;
  String? _Country;
  DateTime? Date;

  bool _isPassengerChecked = false;


  void _AddFlightPassenger() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      
      PassengerData passengerData = PassengerData(
        name: _GivenName,
        lastname:_LastName,
        country: _Country,
        date: Date,
        isChecked: _isPassengerChecked,
      );
      
      widget.onPassengerAdded(passengerData);
      
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",

    child:SingleChildScrollView(
      child: SafeArea(
        child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 35),
      child : Column(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
      
      SizedBox(height: 60,),
        Padding(
           padding:EdgeInsets.only(right: 150),
           child: Text("Add Passengre..",
                  style: TextStyle(
                    color: Color(0XFF1B4158),
                       fontWeight:FontWeight.bold,
                       fontSize: 28,
           ),
          ),
        ),
        SizedBox(height: 20,),
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      onSaved: (value) {
                        _GivenName = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Given Name",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
                    Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                     child: Padding(
                     padding: const EdgeInsets.all(8),
                                 child: TextFormField(
                               
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your last name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _LastName = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
           
                     Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                     child: Padding(
                     padding: const EdgeInsets.all(8),
                                 child: TextFormField(
                                
                     
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your Country';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _Country = value;
                      },
                      decoration: const InputDecoration(
                                  
                     enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                  ),
                                    hintText: "Country",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                    prefixIcon: Icon(
                                      Icons.place,
                                      color: Color(0XFF1B4158),
                                    )),
                    ),
                     ),
                     ),
                     Row(
                    children: [
                      Expanded(
                      child:   Container(
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(60)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            
                          
                            readOnly: true,
                             controller: TextEditingController(text:  Date?.toIso8601String()),
                             decoration: const InputDecoration(
                                    
                             enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(color:Color(0XFF1B4158) ,width: 0.9999),
                                    ),
                                      hintText: "Date of Birth",
                                      hintStyle: TextStyle(color: Colors.grey,fontSize: 16),
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Color(0XFF1B4158),
                                      )),
                                       onTap: ()async{
                  DateTime? result = await showDatePicker(
                    context: context,
                     initialDate: DateTime.now(),
                   firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    
             ) ;
                   if(result != null){
                   setState(() {
                    Date=result;
                     });}}
                          ),
                        ),
                         ),
                      ),
                     
                      
                    ],
                  ),
           
           
           
           
           
           
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 51, 86, 116) ,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                      onPressed: _AddFlightPassenger,
                      child: Text('Add  Passenger',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
                 ),
        ]
         ),
    ), 
      ),
     ) );
  }
}*/
class PassengerData {
  String? name;
  String? idNumber;
  String? lastname;
  String? country;
  DateTime? date;

  bool isChecked = false;

  PassengerData(
      {this.name,
      this.idNumber,
      this.country,
      this.date,
      this.lastname,
      required this.isChecked});
}
