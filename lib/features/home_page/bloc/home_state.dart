part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, fail }

class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.initial, this.homeModel, this.exception});
  final HomeStatus status;
  final HomeModel? homeModel;
  final Object? exception;

  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isError => status == HomeStatus.fail;

  HomeState copyWith(
      {HomeModel? homeModel, HomeStatus? status, Object? exception}) {
    return HomeState(
        homeModel: homeModel ?? this.homeModel,
        status: status ?? this.status,
        exception: exception ?? this.exception);
  }

  @override
  List<Object?> get props => [status, homeModel, exception];
}
