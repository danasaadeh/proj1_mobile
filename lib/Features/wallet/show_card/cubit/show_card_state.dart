import 'package:tourism/model/wallet.dart';

abstract class ShowCardState {}

class ShowCardInitial extends ShowCardState {}

class ShowCardLoading extends ShowCardState {}

class ShowCardSuccess extends ShowCardState {
  final TotalIncome card;
  ShowCardSuccess({
    required this.card,
  });
}

class ShowCardFailure extends ShowCardState {
  final String message;
  ShowCardFailure({required this.message});
}

class ShowCardEmpty extends ShowCardState {
  final String message;

  ShowCardEmpty({
    required this.message,
  });
}
