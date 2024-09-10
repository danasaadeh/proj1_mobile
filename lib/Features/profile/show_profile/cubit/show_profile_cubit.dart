import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:tourism/Features/profile/show_profile/cubit/show_profile_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/user.dart';

class ShowProfileCubit extends Cubit<ShowProfileState> {
  ShowProfileCubit() : super(ShowProfileInitial());
  User? user;

  void ShowProfile() async {
    try {
      emit(ShowProfileLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showPro');
      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        user = User.fromJson(responseData);
        emit(ShowProfileSuccess(
          user: user!,
        ));
      } else {
        emit(ShowProfileFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(ShowProfileFailure(message: "Something went wrong: $e"));
    }
  }

  void deleteProfile() async {
    try {
      emit(ShowProfileLoading());

      String base_url = Api().base_url;
      final data = await Api().get(
          url: '$base_url/deleteProfile', token: prefs!.getString('token'));
      print(data.body.toString());
      if (data.statusCode == 200) {
      } else if (data.statusCode == 404) {
        emit(ShowProfileEmpty(message: 'empty'));
      } else {
        emit(ShowProfileFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      emit(ShowProfileFailure(message: "something is wrong ..."));
    }
  }
}
