import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListWish extends StatelessWidget {
  final String image;
  final String title;

  const ListWish({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF2C3035),
                    fontSize: 14.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Самое необходимое',
                  style: TextStyle(
                    color: const Color(0xFF828696),
                    fontSize: 12.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
        const Icon(
          Icons.chevron_right,
        )
      ],
    );
  }
}
