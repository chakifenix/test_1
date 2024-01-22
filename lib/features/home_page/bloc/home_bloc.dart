import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:effective_test/features/home_page/repository/get_home_data.dart';
import 'package:effective_test/model/home_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeData repo;
  HomeBloc(this.repo) : super(const HomeState()) {
    on<LoadHomeScreen>((event, emit) async {
      // TODO: implement event handler
      final response = await repo.homeScreenData();
      if (response is Response) {
        var data = jsonDecode(response.toString());
        final homeModel = HomeModel.fromJson(data);
        emit(state.copyWith(status: HomeStatus.success, homeModel: homeModel));
      } else {
        emit(state.copyWith(status: HomeStatus.fail));
      }
    });
  }
}
