abstract class ReservRoomState {}

class ReservRoomInitial extends ReservRoomState {}

class ReservRoomLoading extends ReservRoomState {}

class ReservRoomSuccess extends ReservRoomState {
  final String message;

  ReservRoomSuccess({required this.message});
}

class ReservRoomGotFiltersSuccess extends ReservRoomState {}

class ReservRoomFailure extends ReservRoomState {
  final String message;
  ReservRoomFailure({required this.message});
}
