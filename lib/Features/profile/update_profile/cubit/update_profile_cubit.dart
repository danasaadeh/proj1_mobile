import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';
import 'package:tourism/model/user.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  List<Nation>? nat;
  Future<void> getFilters() async {
    emit(UpdateProfileLoading());
    try {
      print("before api request!!");

      final data = await Api()
          .get(url: "${Api().base_url}/getNationalities", token: null);
      print("after api request!!");
      print(data.body.toString());
      if (data.statusCode == 200) {
        List nat_map = jsonDecode(data.body)["data"]["nationalities"];

        nat = List<Nation>.from(nat_map.map((e) => Nation.fromJson(e)));

        emit(UpdateProfileGotFiltersSuccess());
      } else {
        emit(UpdateProfileFailure(message: jsonDecode(data.body)["message"]));
      }
    } catch (e) {
      emit(UpdateProfileFailure(message: e.toString()));
    }
  }

  void UpdateProfile({
    required String name,
    required String email,
    required String gender_id,
    required String phone,
    required String nationality,
    required String age,
  }) async {
    emit(UpdateProfileLoading());
    try {
      String base_url = Api().base_url;
      final requestBody = {
        "name": name,
        "email": email,
        "gender_id": gender_id,
        "phone": phone,
        "nationality_id": nationality,
        "age": age
      };
      final data = await Api().post(
          url: '$base_url/updateProfile',
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print(data.body.toString());
      if (data.statusCode == 200) {
        print('222222220');

        print('afterrrrrrr');
        emit(UpdateProfileSuccess(message: 'sucess'));
      } else {
        print('failureee');
        emit(UpdateProfileFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print('exception');
      emit(UpdateProfileFailure(message: "something is wrong ..."));
    }
  }
}
