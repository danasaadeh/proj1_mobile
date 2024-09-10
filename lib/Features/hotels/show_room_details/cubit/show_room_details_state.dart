import '../../../../model/room_details.dart';

abstract class ShowRoomDetailsState {}

final class ShowRoomDetailsInitial extends ShowRoomDetailsState {}

final class ShowRoomDetailsSuccess extends ShowRoomDetailsState {
  final RoomDetails roomDetails;

  ShowRoomDetailsSuccess({required this.roomDetails});
}

final class ShowRoomDetailsLoading extends ShowRoomDetailsState {}

final class ShowRoomDetailsEmpty extends ShowRoomDetailsState {}

final class ShowRoomDetailsFailure extends ShowRoomDetailsState {
  final String message;
  ShowRoomDetailsFailure({required this.message});
}
