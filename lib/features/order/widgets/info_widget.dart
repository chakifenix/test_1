import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 101.w,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF828796),
                fontSize: 14.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
              ),
            )),
        SizedBox(
          width: 39.w,
        ),
        SizedBox(
            width: 203.w,
            child: Text(
              info,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    );
  }
}
