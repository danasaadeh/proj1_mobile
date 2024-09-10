import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism/Features/attrac/cubit/attrac2_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_cubit.dart';
import 'package:tourism/Features/cubit/Attraction/attraction_details_cubit.dart';
import 'package:tourism/Features/cubit/Auth/check_code_cubit.dart';
import 'package:tourism/Features/cubit/Auth/email_verification_cubit.dart';
import 'package:tourism/Features/cubit/Auth/login_cubit.dart';
import 'package:tourism/Features/cubit/Auth/logout_cubit.dart';
import 'package:tourism/Features/cubit/Auth/register_cubit.dart';
import 'package:tourism/Features/cubit/Auth/reset_passwrd_cubit.dart';
import 'package:tourism/Features/cubit/Trips/add_passenger/cubit/add_passenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/deletepassenger/deletepassenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/editpassenger/editpassenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv/delete_reserv/cubit/delete_trip_reserv_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv/show_details/cubit/trip_reserv_details_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv/update_reserv/cubit/update_trip_reserv_cubit.dart';
import 'package:tourism/Features/cubit/Trips/reserv_trip/cubit/reserv_trip_cubit.dart';
import 'package:tourism/Features/cubit/Trips/show_all_pass/cubit/show_all_passengers_cubit.dart';
import 'package:tourism/Features/cubit/Trips/show_passenger/cubit/show_passenger_cubit.dart';
import 'package:tourism/Features/cubit/Trips/trip_cubit.dart';
import 'package:tourism/Features/cubit/favourite/favourite_cubit.dart';
import 'package:tourism/Features/fav2/cubit/fav2_cubit.dart';
import 'package:tourism/Features/flights/passenger/add/cubit/add_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/delete/cubit/delete_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/show/cubit/show_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/passenger/show_all/cubit/show_all_flight_passenegers_cubit.dart';
import 'package:tourism/Features/flights/passenger/update/cubit/update_flight_passenger_cubit.dart';
import 'package:tourism/Features/flights/reserv_flight/cubit/reserv_flight_cubit.dart';
import 'package:tourism/Features/flights/reservation/delete_reserv/cubit/delete_flight_reserv_cubit.dart';
import 'package:tourism/Features/flights/reservation/show_details/cubit/flight_reserv_details_cubit.dart';
import 'package:tourism/Features/flights/reservation/update_reserv/cubit/update_flight_reserv_cubit.dart';
import 'package:tourism/Features/flights/review/cubit/flight_review_cubit.dart';
import 'package:tourism/Features/flights/search_flight/cubit/search_flight_cubit.dart';
import 'package:tourism/Features/flights/show_flight_details/cubit/show_flight_details_cubit.dart';
import 'package:tourism/Features/home/cubit/home_cubit.dart';
import 'package:tourism/Features/hotels/hotel_fav/cubit/hotel_fav_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/delet_reserv/cubit/delete_hotel_reserv_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/show_details/cubit/hotel_reserv_details_cubit.dart';
import 'package:tourism/Features/hotels/hotel_reserv/update_reserv/cubit/update_hotel_reserv_cubit.dart';
import 'package:tourism/Features/hotels/reserv/cubit/reserv_room_cubit.dart';
import 'package:tourism/Features/hotels/review/cubit/hotel_review_cubit.dart';
import 'package:tourism/Features/hotels/search/cubit/search_cubit.dart';
import 'package:tourism/Features/hotels/show_hotel_details/cubit/show_hotel_details_cubit.dart';
import 'package:tourism/Features/hotels/show_room_details/cubit/show_room_details_cubit.dart';
import 'package:tourism/Features/profile/show_profile/cubit/show_profile_cubit.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_cubit.dart';
import 'package:tourism/Features/reservations/cubit/reservation_cubit.dart';
import 'package:tourism/Features/trip-fav/cubit/fav_trip_cubit.dart';
import 'package:tourism/Features/wallet/create_wallet/cubit/create_wallet_cubit.dart';
import 'package:tourism/Features/wallet/show_card/cubit/show_card_cubit.dart';
import 'package:tourism/Features/wallet/show_wallet/cubit/show_wallet_cubit.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/add_pass_model.dart';
import 'package:tourism/model/attraction_model.dart';

import 'package:tourism/model/flight_details_model.dart';
import 'package:tourism/model/flight_result_model.dart';
import 'package:tourism/model/payment_flight_model.dart';
import 'package:tourism/pages/addPassenger.dart';
import 'package:tourism/pages/attrac_details.dart';
import 'package:tourism/pages/attractions.dart';
import 'package:tourism/pages/boarding_pages.dart';
import 'package:tourism/pages/boarding_pass.dart';
import 'package:tourism/pages/create_wallet.dart';
import 'package:tourism/pages/creatwallet_success.dart';
import 'package:tourism/pages/detailsflight.dart';
import 'package:tourism/pages/edit_Profile.dart';
import 'package:tourism/pages/favorite.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/flights.dart';
import 'package:tourism/pages/forgotpass.dart';
import 'package:tourism/pages/home.dart';
import 'package:tourism/pages/hotel_search.dart';
import 'package:tourism/pages/hotels.dart';
import 'package:tourism/pages/hotels_filter.dart';
import 'package:tourism/pages/login.dart';
import 'package:tourism/pages/mybooking.dart';
import 'package:tourism/pages/payment_flight.dart';
import 'package:tourism/pages/personal_Info.dart';
import 'package:tourism/pages/profile.dart';
import 'package:tourism/pages/resetpass.dart';
import 'package:tourism/pages/resultflight.dart';
import 'package:tourism/pages/roombooking.dart';
import 'package:tourism/pages/roomdetails.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/pages/splash.dart';
import 'package:tourism/pages/success.dart';
import 'package:tourism/pages/tripBooking.dart';
import 'package:tourism/pages/trip_details.dart';
import 'package:tourism/pages/tripaddPassenger.dart';
import 'package:tourism/pages/trips.dart';
import 'package:tourism/pages/verification.dart';
import 'package:tourism/pages/wallet_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
      BlocProvider(
        create: (context) => ResetPasswrdCubit(),
      ),
      BlocProvider(
        create: (context) => CheckCodeCubit(),
      ),
      BlocProvider(
        create: (context) => EmailVerificationCubit(),
      ),
      BlocProvider(
        create: (context) => LogoutCubit(),
      ),
      BlocProvider(
        create: (context) => AttractionCubit(),
      ),
      BlocProvider(
        create: (context) => AttractionDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => ShowProfileCubit(),
      ),
      BlocProvider(
        create: (context) => UpdateProfileCubit(),
      ),
      BlocProvider(
        create: (context) => WalletCubit(),
      ),
      BlocProvider(
        create: (context) => CreateWalletCubit(),
      ),
      BlocProvider(
        create: (context) => ShowCardCubit(),
      ),
      BlocProvider(
        create: (context) => HomeCubit(),
      ),
      BlocProvider(
        create: (context) => TripCubit(),
      ),
      BlocProvider(
        create: (context) => FavouriteCubit(),
      ),
      BlocProvider(
        create: (context) => AttracCubit(),
      ),
      BlocProvider(
        create: (context) => Fav2Cubit(),
      ),
      BlocProvider(
        create: (context) => FavTripCubit(),
      ),
      BlocProvider(
        create: (context) => AddPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => ReservTripCubit(),
      ),
      BlocProvider(
        create: (context) => SearchHotelCubit(),
      ),
      BlocProvider(
        create: (context) => ReservRoomCubit(),
      ),
      BlocProvider(
        create: (context) => HotelReviewCubit(),
      ),
      BlocProvider(
        create: (context) => ShowHotelDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => ShowRoomDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => HotelFavCubit(),
      ),
      BlocProvider(
        create: (context) => SearchFlightCubit(),
      ),
      BlocProvider(
        create: (context) => ReservFlightCubit(),
      ),
      BlocProvider(
        create: (context) => AddFlightPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => UpdateFlightPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => DeleteFlightPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => ShowFlightPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => FlightReviewCubit(),
      ),
      BlocProvider(
        create: (context) => ShowFlightDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => DeletePassengerCubit(),
      ),
      BlocProvider(
        create: (context) => EditPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => ShowPassengerCubit(),
      ),
      BlocProvider(
        create: (context) => ReservationCubit(),
      ),
      BlocProvider(
        create: (context) => ShowAllPassengersCubit(),
      ),
      BlocProvider(
        create: (context) => ShowAllFlightPassengersCubit(),
      ),
      BlocProvider(
        create: (context) => UpdateHotelReservCubit(),
      ),
      BlocProvider(
        create: (context) => UpdateFlightReservCubit(),
      ),
      BlocProvider(
        create: (context) => UpdateTripReservCubit(),
      ),
      BlocProvider(
        create: (context) => TripReservDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => HotelReservDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => FlightReservDetailsCubit(),
      ),
      BlocProvider(
        create: (context) => DeleteHotelReservCubit(),
      ),
      BlocProvider(
        create: (context) => DeleteFlightReservCubit(),
      ),
      BlocProvider(
        create: (context) => DeleteTripReservCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var boardingPass;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => Homepage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        ForgotPassword.id: (context) => ForgotPassword(),

        // Verifictication.id: (context) => Verifictication(),
        ResetPassword.id: (context) => ResetPassword(),
        FlightPage.id: (context) => FlightPage(),
        attracPage.id: (context) => attracPage(),
        Success.id: (context) => Success(),
        // AttractonDetails.id: (context) => AttractonDetails(
        //     imagePath: '', name: '', location: '', description: '', review: []),
        hotelSearch.id: (context) => hotelSearch(),
        hotelPage.id: (context) => hotelPage(
              data: [],
            ),
        FilterOptionsDialog.id: (context) => FilterOptionsDialog(),
        RoomBooking.id: (context) => RoomBooking(),
        RoomDetailsPage.id: (context) => RoomBooking(),
        tripPage.id: (context) => tripPage(),
        editProfile.id: (context) => editProfile(),
        profilePage.id: (context) => profilePage(),
        creatWallet.id: (context) => creatWallet(),
        walletPage.id: (context) => walletPage(),
        createwalletSuccess.id: (context) => createwalletSuccess(),
        // ResultFlight.id: (context) => ResultFlight(
        //     // flightinfores: flightInfoRes(
        //     //     nyc: '',
        //     //     time: '',
        //     //     ldn: '',
        //     //     date: '',
        //     //     depature: '',
        //     //     number: '',
        //     //     allDate: DateTime(2024),
        //     //     imagePath: '',
        //     //     departureTime: '',
        //     //     arrivalTime: '')
        //         ),
        // DetailsFlight.id: (context) => DetailsFlight(
        //       flightinfodet: flightInfoDet(
        //           ldn: '', nyc: '', time: '', price: '', number: ''),
        //     ),
        FirstPage.id: (context) => FirstPage(),
        Onbording.id: (context) => Onbording(),
        // tripBooking.id: (context) => tripBooking(
        //     tripId: 1,
        //     data: AddPassenger(
        //         givenName: '',
        //         lastName: '',
        //         dateOfBirth: '',
        //         city: City(id: 0, cityName: ''),
        //         id: 0)
        //     //idPass: 5,
        //     ),
        // tripaddPassenger.id: (context) => tripaddPassenger(
        //       onPassengerAdded: (PassengerData) {},
        //     ),
        // AddPassengersScreen.id: (context) => AddPassengersScreen(
        //       onPassengerAdded: (PassengerData) {},
        //     ),
        // // Personal_Info.id: (context) => Personal_Info(),
        // Payment_Flight.id: (context) => Payment_Flight(
        //     paymentflight: PaymentFlight(
        //         nyc: '', time: '', ldn: '', date: '', price: '', number: '')),
        // Success.id: (context) => Success(),
        // MyBooking.id: (context) => MyBooking(
        //       flight: flightInfoRes(
        //         nyc: '',
        //         time: '',
        //         ldn: '',
        //         date: '',
        //         depature: '',
        //         number: '',
        //         allDate: DateTime(2024),
        //         imagePath: '',
        //         departureTime: '',
        //         arrivalTime: '',
        //       ),
        //     ),
        favouritPage.id: (context) => favouritPage(),
        // boardingPass.id: (context) => BoardingPass(flightpass: Flights[0])
      },
      home: Onbording(),
    );
  }
}
