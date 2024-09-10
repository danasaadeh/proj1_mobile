part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

class FavouriteLoading extends FavouriteState {}

class FavouriteTripSuccess extends FavouriteState {
  final List<Trip> trip;

  FavouriteTripSuccess({
    required this.trip,
  });
}

class FavouriteAttracSuccess extends FavouriteState {
  final List<int> attrac;
  final List<Attraction> attraction;
  FavouriteAttracSuccess({required this.attrac, required this.attraction});
}

class FavouriteFailure extends FavouriteState {
  final String message;
  FavouriteFailure({required this.message});
}

class FavouriteEmpty extends FavouriteState {
  final String message;

  FavouriteEmpty({
    required this.message,
  });
}
