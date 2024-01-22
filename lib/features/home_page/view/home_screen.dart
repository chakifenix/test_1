import 'package:effective_test/features/home_page/bloc/home_bloc.dart';
import 'package:effective_test/features/home_page/repository/get_home_data.dart';
import 'package:effective_test/features/home_page/widgets/listwish.dart';
import 'package:effective_test/features/list_room_page/view/list_room_screen.dart';
import 'package:effective_test/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final controller = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    selectRoom() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ListRoomScreen(
                    appBarTitle: title,
                  )));
    }

    final homeBloc = HomeBloc(HomeData());
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Отель',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => homeBloc..add(LoadHomeScreen()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isSuccess) {
              final HomeModel info = state.homeModel!;
              final List peculiarities = info.aboutTheHotel.peculiarities;
              List images = info.imageUrls;
              title = info.name;
              return ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x3F000000),
                            blurRadius: 4.r,
                            offset: Offset(0, 4.h),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.r),
                            bottomRight: Radius.circular(12.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 5.h,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 257.h,
                              child:
                                  PageView(controller: controller, children: [
                                for (int i = 0; i < images.length; i++)
                                  Row(
                                    children: [
                                      Container(
                                        width: 343.w,
                                        height: 257.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.r)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: Image.network(
                                            images[i],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ]),
                            ),
                            Positioned(
                              bottom: 8.h,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: images.length,
                                  effect: ScrollingDotsEffect(
                                    dotWidth: 8.w,
                                    dotHeight: 8.h,
                                    activeDotScale: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: const Color(0x33FFC600),
                                    borderRadius: BorderRadius.circular(5.r)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15.sp,
                                      color: const Color(0xFFFFA800),
                                    ),
                                    Text(
                                      '${info.rating} ${info.ratingName}',
                                      style: TextStyle(
                                        color: const Color(0xFFFFA800),
                                        fontSize: 16.sp,
                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          info.name,
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
                          info.adress,
                          style: TextStyle(
                            color: const Color(0xFF0D72FF),
                            fontSize: 12.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 174,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'от ${info.minimalPrice} ₽',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28.sp,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              info.priceForIt,
                              style: TextStyle(
                                color: const Color(0xFF828796),
                                fontSize: 14.sp,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Об отеле',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: [
                            for (int i = 0; i < peculiarities.length; i++)
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 5.h),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFBFBFC)),
                                  child: Text(
                                    info.aboutTheHotel.peculiarities[i],
                                    style: TextStyle(
                                      color: const Color(0xFF828796),
                                      fontSize: 14.sp,
                                      fontFamily: 'SF Pro Display',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          info.aboutTheHotel.description,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8999999761581421),
                            fontSize: 14.sp,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          color: const Color(0xFFFBFBFC),
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 15.w),
                          child: Column(
                            children: [
                              const ListWish(
                                image: 'images/emoji.svg',
                                title: 'Удобства',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 275.w,
                                    height: 1,
                                    color: const Color(0x26828796),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const ListWish(
                                image: 'images/pticka.svg',
                                title: 'Что включено',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 275.w,
                                    height: 1,
                                    color: const Color(0x26828796),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const ListWish(
                                image: 'images/close.svg',
                                title: 'Удобства',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: 16.w, right: 16.w, top: 12.h, bottom: 28.h),
                    child: CupertinoButton(
                      borderRadius: BorderRadius.circular(16),
                      onPressed: selectRoom,
                      color: Colors.blue,
                      child: const Text('К выбору номера'),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
