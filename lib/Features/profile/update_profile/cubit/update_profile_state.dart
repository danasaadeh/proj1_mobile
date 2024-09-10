import 'package:tourism/model/user.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String message;

  UpdateProfileSuccess({
    required this.message,
  });
}

class UpdateProfileGotFiltersSuccess extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;
  UpdateProfileFailure({required this.message});
}
