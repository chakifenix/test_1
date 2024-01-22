import 'dart:math';

import 'package:effective_test/features/home_page/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastScreen extends StatelessWidget {
  LastScreen({super.key});

  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            'Заказ оплачен',
            style: TextStyle(color: Colors.black),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 138.h,
                ),
                Image.asset('images/success.png'),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  'Ваш заказ принят в работу',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 329.w,
                  child: Text(
                    'Подтверждение заказа №${random.nextInt(1000000)} может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF828796),
                      fontSize: 16.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0xFFE8E9EC)))),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF0D72FF),
                    borderRadius: BorderRadius.circular(20.r)),
                child: CupertinoButton(
                  child: Text(
                    'Супер!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
