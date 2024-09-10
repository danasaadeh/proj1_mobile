part of 'reset_passwrd_cubit.dart';

@immutable
sealed class ResetPasswrdState {}

final class ResetPasswrdInitial extends ResetPasswrdState {}

class ResetPasswordSuccess extends ResetPasswrdState {
  final String message;
  final int role;
  ResetPasswordSuccess({required this.message, required this.role});
}

class ResetPasswordLoading extends ResetPasswrdState {}

class ResetPasswordValidationFailure extends ResetPasswrdState {
  final Map<String, List<dynamic>> errors;
  ResetPasswordValidationFailure({required this.errors});
}

class ResetPasswordFailure extends ResetPasswrdState {
  final String message;

  ResetPasswordFailure({required this.message});
}

class ResetPasswordSecure extends ResetPasswrdState {}

class ResetPasswordInSecure extends ResetPasswrdState {}
