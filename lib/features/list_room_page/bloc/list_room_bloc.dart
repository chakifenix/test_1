import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:effective_test/features/list_room_page/repository/list_room_data.dart';
import 'package:effective_test/model/list_room_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_room_event.dart';
part 'list_room_state.dart';

class ListRoomBloc extends Bloc<ListRoomEvent, ListRoomState> {
  ListRoomData repo;
  ListRoomBloc(this.repo) : super(ListRoomState()) {
    on<LoadListRooms>((event, emit) async {
      // TODO: implement event handler
      final response = await repo.listRoomData();
      if (response is Response) {
        var data = jsonDecode(response.toString());
        final listRoomModel = ListRoomModel.fromJson(data);
        emit(state.copyWith(
            status: ListRoomStatus.success, listRoomModel: listRoomModel));
      } else {
        emit(state.copyWith(status: ListRoomStatus.fail));
      }
    });
  }
}
