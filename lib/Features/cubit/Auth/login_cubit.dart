import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool is_scure = true;
  void changeVisibility() {
    is_scure = !is_scure;
    if (is_scure)
      emit(LoginSecure());
    else
      emit(LoginInSecure());
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().post(
        url: "$base_url/signin",
        body: {
          'email': email,
          'password': password,
        },
        token: null,
      );
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        prefs?.setString('token', jsonDecode(data.body)['data']['token']);
        prefs?.setString('name', jsonDecode(data.body)['data']['name']);
        print(jsonDecode(data.body)['data']['token']);
        prefs?.setInt('role_id',
            jsonDecode(data.body)['data']['roles']['pivot']['role_id']);

        final role_id =
            jsonDecode(data.body)['data']['roles']['pivot']['role_id'];
        print(role_id);
        emit(LoginSuccess(
            message: jsonDecode(data.body)["message"], role_id: role_id));
      } else if (data.statusCode == 422) {
        var errors =
            Map<String, List<dynamic>>.from(jsonDecode(data.body)["errors"]);
        emit(LoginValidationFailure(errors: errors));
      } else {
        emit(LoginFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(LoginFailure(message: "there is something wrong.."));
    }
  }
}
