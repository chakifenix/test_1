part of 'order_bloc.dart';

enum OrderStatus { initial, loading, success, fail }

class OrderState extends Equatable {
  const OrderState(
      {this.status = OrderStatus.initial, this.orderModel, this.exception});
  final OrderStatus status;
  final OrderModel? orderModel;
  final Object? exception;

  bool get isLoading => status == OrderStatus.loading;
  bool get isSuccess => status == OrderStatus.success;
  bool get isError => status == OrderStatus.fail;

  OrderState copyWith(
      {OrderModel? orderModel, OrderStatus? status, Object? exception}) {
    return OrderState(
        orderModel: orderModel ?? this.orderModel,
        status: status ?? this.status,
        exception: exception ?? this.exception);
  }

  @override
  List<Object?> get props => [status, orderModel, exception];
}
