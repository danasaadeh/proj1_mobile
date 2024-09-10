import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourism/Features/profile/show_profile/cubit/show_profile_cubit.dart';
import 'package:tourism/Features/profile/update_profile/cubit/update_profile_state.dart';
import 'package:tourism/Features/wallet/create_wallet/cubit/create_wallet_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/helper/constante.dart';

class CreateWalletCubit extends Cubit<CreateWalletState> {
  CreateWalletCubit() : super(CreateWalletInitial());

  void CreateWallet(
      {required String total_income,
      required String wallet_password,
      required context}) async {
    emit(CreateWalletLoading());
    try {
      String base_url = Api().base_url;
      final requestBody = {
        "total_encom": total_income,
        "wallet_password": wallet_password
      };
      final data = await Api().post(
          url: '$base_url/createWallet',
          body: jsonEncode(requestBody),
          content: 'application/json',
          token: prefs!.getString("token"));
      print(data.body.toString());
      if (data.statusCode == 200) {
        print('222222220');

        print('afterrrrrrr');
        emit(CreateWalletSuccess(message: 'sucess'));
      } else {
        print('failureee');
        emit(CreateWalletFailure(message: jsonDecode(data.body)["message"]));
      }
    } on Exception catch (e) {
      print('exception');
      emit(CreateWalletFailure(message: "something is wrong ..."));
    }
  }
}
