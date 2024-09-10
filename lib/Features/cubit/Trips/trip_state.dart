part of 'trip_cubit.dart';

@immutable
sealed class TripState {}

final class TripInitial extends TripState {}

class TripLoadingState extends TripState {}

class TripLoadedState extends TripState {
  final List<Trip> trip;

  TripLoadedState({required this.trip});
}

class FavoriteSuccessState extends TripState {
  FavoriteSuccessState();
}

class FavoriteInSuccessState extends TripState {
  FavoriteInSuccessState();
}

class TripDeletedState extends TripState {}

class TripErrorState extends TripState {
  final String errorMessage;

  TripErrorState(this.errorMessage);
}
