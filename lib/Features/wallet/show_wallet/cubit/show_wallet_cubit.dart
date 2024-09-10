import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/Features/wallet/show_wallet/cubit/show_wallet_state.dart';
import 'package:tourism/helper/api.dart';
import 'package:tourism/model/wallet.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  void getIncome() async {
    try {
      emit(WalletLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/returnTotalEncom');

      if (data.statusCode == 200) {
        final responseData = jsonDecode(data.body);
        // print(responseData.toString());
        final income = TotalIncome.fromJson(responseData);

        emit(WalletCardSuccess(card: income));
      } else {
        final errorMessage = 'Error ${data.statusCode}: ${data.reasonPhrase}';
        emit(WalletFailure(message: errorMessage));
      }
    } on Exception catch (e) {
      emit(WalletFailure(message: "Something went wrong: $e"));
    }
  }

  void getActiv() async {
    try {
      emit(WalletLoading());
      String base_url = Api().base_url;
      final data = await Api().get(url: '$base_url/showActivities');
      if (data.statusCode == 200) {
        print('20000000');
        final responseData = jsonDecode(data.body);
        print('after decodeeeee');
        if (responseData.isEmpty) {
          // No hotel information available
          emit(WalletEmpty(message: 'Empty'));
        } else if (responseData is List) {
          final activList =
              (responseData as List).map((e) => Activity.fromJson(e)).toList();
          emit(WalletActivitySuccess(activ: activList));
        } else {
          // Unexpected data format
          emit(WalletFailure(message: 'Unexpected data format'));
        }
      } else {
        emit(WalletFailure(message: 'Error fetching admin data'));
      }
    } on Exception catch (e) {
      emit(WalletFailure(message: "Something went wrong: $e"));
    }
  }

  void getWalletData() async {
    try {
      emit(WalletLoading());

      String base_url = Api().base_url;

      // Fetch total income
      final incomeData = await Api().get(url: '$base_url/returnTotalEncom');
      if (incomeData.statusCode == 200) {
        final responseData = jsonDecode(incomeData.body);
        final income = TotalIncome.fromJson(responseData);

        // Fetch activities
        final activitiesData = await Api().get(url: '$base_url/showActivities');
        if (activitiesData.statusCode == 200) {
          final activitiesResponseData = jsonDecode(activitiesData.body);
          if (activitiesResponseData.isEmpty) {
            emit(WalletEmpty(message: 'No activities available'));
          } else if (activitiesResponseData is List) {
            final activities = (activitiesResponseData as List)
                .map((e) => Activity.fromJson(e))
                .toList();

            // Emit the success state with both income and activities
            emit(WalletSuccess(card: income, activ: activities));
          } else {
            emit(WalletFailure(
                message: 'Unexpected data format for activities'));
          }
        } else {
          emit(WalletFailure(message: 'Error fetching activities'));
        }
      } else {
        emit(WalletFailure(message: 'Error fetching total income'));
      }
    } on Exception catch (e) {
      emit(WalletFailure(message: "Something went wrong: $e"));
    }
  }
  /*void getWalletData() async {
    try {
      emit(WalletLoading());

      String base_url = Api().base_url;

      // Fetch total income
      final incomeResponse = await Api().get(url: '$base_url/returnTotalEncom');
      TotalIncome? income;
      if (incomeResponse.statusCode == 200) {
        print('incomeeeeeeeeeee');
        final incomeData = jsonDecode(incomeResponse.body);
        income = TotalIncome.fromJson(incomeData);
      } else {
        print('nooooooooo');
        emit(WalletFailure(message: 'Error fetching total income.'));
        print('whhyyyyyyyyyy');
        return;
      }

      // Fetch activities
      final activitiesResponse =
          await Api().get(url: '$base_url/showActivities');
      List<Activity>? activities;
      if (activitiesResponse.statusCode == 200) {
        final activitiesData = jsonDecode(activitiesResponse.body);
        if (activitiesData.isEmpty) {
          emit(WalletEmpty(message: 'No activities found.'));
          return;
        }
        activities =
            (activitiesData as List).map((e) => Activity.fromJson(e)).toList();
      } else {
        emit(WalletFailure(message: 'Error fetching activities.'));
        return;
      }

      // Emit the WalletSuccess state
      emit(WalletSuccess(
        card: income,
        activ: activities,
      ));
    } on Exception catch (e) {
      emit(WalletFailure(message: "Something went wrong: $e"));
    }
  }*/
}
