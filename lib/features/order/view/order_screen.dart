import 'package:effective_test/features/last_page/view/last_screen.dart';
import 'package:effective_test/features/order/bloc/order_bloc.dart';
import 'package:effective_test/features/order/repository/order_data.dart';
import 'package:effective_test/features/order/widgets/info_widget.dart';
import 'package:effective_test/features/order/widgets/textfield_app.dart';
import 'package:effective_test/features/order/widgets/tourist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    final orderBloc = OrderBloc(OrderData());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        title: Text(
          'Бронирование',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => orderBloc..add(LoadOrder()),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state.isSuccess) {
              final orderInfo = state.orderModel!;
              return ListView(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Color(0x33FFC600)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFA800),
                                  ),
                                  Text(
                                    '5 Превосходно',
                                    style: TextStyle(
                                      color: Color(0xFFFFA800),
                                      fontSize: 14.sp,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          orderInfo.hotelName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          orderInfo.hotelAdress,
                          style: TextStyle(
                            color: Color(0xFF0D72FF),
                            fontSize: 12.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoWidget(
                          title: 'Вылет из',
                          info: orderInfo.departure,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Страна, город',
                          info: orderInfo.arrivalCountry,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Даты',
                          info:
                              '${orderInfo.tourDateStart} - ${orderInfo.tourDateStop}',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Кол-во ночей',
                          info: '${orderInfo.numberOfNights}',
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Отель',
                          info: orderInfo.hotelName,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Номер',
                          info: orderInfo.room,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InfoWidget(
                          title: 'Питание',
                          info: orderInfo.nutrition,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Информация о покупателе',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFieldApp(
                          title: 'Номер телефона',
                          phoneNumber: true,
                          email: false,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextFieldApp(
                          title: 'Почта',
                          phoneNumber: false,
                          email: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 12.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Tourist(
                    title: 'Первый турист',
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Tourist(title: 'Второй турист '),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добавить туриста',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF0D72FF),
                                borderRadius: BorderRadius.circular(6.r)),
                            child: SvgPicture.asset('images/plus.svg'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Тур',
                              style: TextStyle(
                                color: Color(0xFF828796),
                                fontSize: 14.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text('${orderInfo.tourPrice} ₽')
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Топливный сбор',
                              style: TextStyle(
                                color: Color(0xFF828796),
                                fontSize: 14.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text('${orderInfo.fuelCharge} ₽')
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Сервисный сбор',
                              style: TextStyle(
                                color: Color(0xFF828796),
                                fontSize: 14.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text('1${orderInfo.serviceCharge} ₽')
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'К оплате',
                              style: TextStyle(
                                color: Color(0xFF828796),
                                fontSize: 14.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                                '${orderInfo.tourPrice + orderInfo.fuelCharge + orderInfo.serviceCharge} ₽')
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Container(
                      child: CupertinoButton(
                        color: Color(0xFF0D72FF),
                        child: Text(
                            '${orderInfo.tourPrice + orderInfo.fuelCharge + orderInfo.serviceCharge} ₽'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LastScreen()));
                        },
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
