import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  // AuthServices auth = AuthServices();

  void register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    emit(RegisterLoading());
    try {
      String base_url = Api().base_url;
      print("before api request!!");
      final data = await Api().post(
        url: "$base_url/register",
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
        },
        token: null,
      );
      print("token");
      inspect(data);
      print("after api request!!");
      print(data.body.toString());

      if (data.statusCode == 200) {
        prefs?.setString('token', jsonDecode(data.body)['data']['token']);
        print(jsonDecode(data.body)['data']['token']);
        prefs?.setInt('role_id',
            jsonDecode(data.body)['data']['roles']['pivot']['role_id']);

        final role_id =
            jsonDecode(data.body)['data']['roles']['pivot']['role_id'];
        print(role_id);
        emit(RegisterSuccess(
            message: jsonDecode(data.body)["message"], role_id: role_id));
      } else if (data.statusCode == 422) {
        var errors =
            Map<String, List<dynamic>>.from(jsonDecode(data.body)["errors"]);
        emit(RegisterValidationFailure(errors: errors));
      } else {
        emit(RegisterFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print(e.toString());
      emit(RegisterFailure(message: "there is something wrong.."));
    }
  }
}
