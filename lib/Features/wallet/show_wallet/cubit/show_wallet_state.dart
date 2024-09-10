import 'package:tourism/model/wallet.dart';

abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletActivitySuccess extends WalletState {
  final List<Activity> activ;

  WalletActivitySuccess({
    required this.activ,
  });
}

class WalletCardSuccess extends WalletState {
  final TotalIncome card;
  WalletCardSuccess({
    required this.card,
  });
}

class WalletFailure extends WalletState {
  final String message;
  WalletFailure({required this.message});
}

class WalletEmpty extends WalletState {
  final String message;

  WalletEmpty({
    required this.message,
  });
}

class WalletSuccess extends WalletState {
  final TotalIncome card;
  final List<Activity> activ;

  WalletSuccess({
    required this.card,
    required this.activ,
  });
}
