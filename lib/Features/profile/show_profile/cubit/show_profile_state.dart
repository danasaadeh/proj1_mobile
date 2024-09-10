import 'package:tourism/model/user.dart';

abstract class ShowProfileState {}

class ShowProfileInitial extends ShowProfileState {}

class ShowProfileLoading extends ShowProfileState {}

class ShowProfileSuccess extends ShowProfileState {
  final User user;

  ShowProfileSuccess({
    required this.user,
  });
}

class ShowProfileFailure extends ShowProfileState {
  final String message;
  ShowProfileFailure({required this.message});
}

class ShowProfileGotFiltersSuccess extends ShowProfileState {}

class ShowProfileEmpty extends ShowProfileState {
  final String message;

  ShowProfileEmpty({
    required this.message,
  });
}

// class ShowProfileDeletSuccess extends ShowProfileState {
//   final String message;

//   ShowProfileDeletSuccess({
//     required this.message,
//   });
// }
