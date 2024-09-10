import 'package:tourism/model/hotel_search_model.dart';

abstract class SearchHotelState {}

class SearchHotelInitial extends SearchHotelState {}

class SearchHotelLoading extends SearchHotelState {}

class SearchHotelSuccess extends SearchHotelState {
  final String message;
  final List<Hotels> hotels;

  SearchHotelSuccess({required this.message, required this.hotels});
}

class SearchHotelGotFiltersSuccess extends SearchHotelState {}

class SearchHotelFailure extends SearchHotelState {
  final String message;
  SearchHotelFailure({required this.message});
}

class SearchHotelEmpty extends SearchHotelState {
  final String message;
  SearchHotelEmpty({required this.message});
}
