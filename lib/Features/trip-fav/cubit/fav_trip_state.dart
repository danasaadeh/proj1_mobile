abstract class FavTripState {}

final class FavTripInitial extends FavTripState {}

final class FavTripSuccess extends FavTripState {}

final class FavTripLoading extends FavTripState {}

final class FavTripFailure extends FavTripState {
  final String message;
  FavTripFailure({required this.message});
}

final class FavTripEmpty extends FavTripState {
  final String message;
  FavTripEmpty({required this.message});
}
