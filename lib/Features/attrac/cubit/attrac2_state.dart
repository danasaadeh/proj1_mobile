import 'package:tourism/model/attraction_model.dart';

abstract class AttracState {}

final class AttracInitial extends AttracState {}

final class AttracSuccess extends AttracState {
  final List<Attraction> attrac;

  AttracSuccess({required this.attrac});
}

final class AttracLoading extends AttracState {}

final class AttracEmpty extends AttracState {}

final class AttracFailure extends AttracState {
  final String message;
  AttracFailure({required this.message});
}
