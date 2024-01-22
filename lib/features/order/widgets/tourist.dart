import 'package:effective_test/features/order/widgets/textfield_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tourist extends StatefulWidget {
  Tourist({
    required this.title,
  });

  final String title;

  @override
  State<Tourist> createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  bool expand = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expand = !expand;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0x190D72FF)),
                  child: Transform.rotate(
                      angle: (expand) ? 1.5708 : -1.5708,
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
            (expand)
                ? Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFieldApp(
                        title: 'Имя',
                        phoneNumber: false,
                        email: false,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldApp(
                        title: 'Фамилия',
                        phoneNumber: false,
                        email: false,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldApp(
                        title: 'Дата рождения',
                        phoneNumber: false,
                        email: false,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldApp(
                        title: 'Гражданство',
                        phoneNumber: false,
                        email: false,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldApp(
                        title: 'Номер загранпаспорта',
                        phoneNumber: false,
                        email: false,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldApp(
                        title: 'Срок действия загранпаспорта',
                        phoneNumber: false,
                        email: false,
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
