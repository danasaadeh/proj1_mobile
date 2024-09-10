import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/wallet/show_card/cubit/show_card_state.dart';

import 'package:tourism/helper/api.dart';
import 'package:tourism/model/wallet.dart';

class ShowCardCubit extends Cubit<ShowCardState> {
  ShowCardCubit() : super(ShowCardInitial());

  void getIncome() async {
    try {
      emit(ShowCardLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/returnTotalEncom');

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final income = TotalIncome.fromJson(responseData);

        emit(ShowCardSuccess(card: income));
      } else {
        final errorMessage = 'Error ${data.statusCode}: ${data.reasonPhrase}';
        emit(ShowCardFailure(message: errorMessage));
      }
    } on Exception catch (e) {
      emit(ShowCardFailure(message: "Something went wrong: $e"));
    }
  }
}
