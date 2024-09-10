abstract class HotelFavState {}

final class HotelFavInitial extends HotelFavState {}

final class HotelFavSuccess extends HotelFavState {}

final class HotelFavLoading extends HotelFavState {}

final class HotelFavFailure extends HotelFavState {
  final String message;
  HotelFavFailure({required this.message});
}

final class HotelFavEmpty extends HotelFavState {
  final String message;
  HotelFavEmpty({required this.message});
}
