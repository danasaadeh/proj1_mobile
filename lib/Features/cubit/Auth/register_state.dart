part of 'register_cubit.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String message;
  final int role_id;

  RegisterSuccess({required this.message, required this.role_id});
}

final class RegisterLoading extends RegisterState {}

class RegisterValidationFailure extends RegisterState {
  final Map<String, List<dynamic>> errors;
  RegisterValidationFailure({required this.errors});
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure({required this.message});
}
