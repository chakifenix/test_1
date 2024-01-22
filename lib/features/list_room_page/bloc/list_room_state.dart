part of 'list_room_bloc.dart';

enum ListRoomStatus { initial, loading, success, fail }

class ListRoomState extends Equatable {
  const ListRoomState(
      {this.status = ListRoomStatus.initial,
      this.listRoomModel,
      this.exception});
  final ListRoomStatus status;
  final ListRoomModel? listRoomModel;
  final Object? exception;

  bool get isLoading => status == ListRoomStatus.loading;
  bool get isSuccess => status == ListRoomStatus.success;
  bool get isError => status == ListRoomStatus.fail;

  ListRoomState copyWith(
      {ListRoomModel? listRoomModel,
      ListRoomStatus? status,
      Object? exception}) {
    return ListRoomState(
        listRoomModel: listRoomModel ?? this.listRoomModel,
        status: status ?? this.status,
        exception: exception ?? this.exception);
  }

  @override
  List<Object?> get props => [status, listRoomModel, exception];
}
