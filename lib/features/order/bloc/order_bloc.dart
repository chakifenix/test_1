import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:effective_test/features/order/repository/order_data.dart';
import 'package:effective_test/model/order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderData repo;
  OrderBloc(this.repo) : super(OrderState()) {
    on<LoadOrder>((event, emit) async {
      // TODO: implement event handler
      final response = await repo.orderData();
      if (response is Response) {
        var data = jsonDecode(response.toString());
        final orderModel = OrderModel.fromJson(data);
        emit(state.copyWith(
            status: OrderStatus.success, orderModel: orderModel));
      } else {
        emit(state.copyWith(status: OrderStatus.fail));
      }
    });
  }
}
