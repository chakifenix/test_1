import 'package:effective_test/features/list_room_page/bloc/list_room_bloc.dart';
import 'package:effective_test/features/list_room_page/repository/list_room_data.dart';
import 'package:effective_test/features/order/view/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListRoomScreen extends StatelessWidget {
  ListRoomScreen({super.key, required this.appBarTitle});
  final controller = PageController();
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    final listRoomBloc = ListRoomBloc(ListRoomData());
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F9),
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            appBarTitle,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocProvider(
          create: (context) => listRoomBloc..add(LoadListRooms()),
          child: BlocBuilder<ListRoomBloc, ListRoomState>(
            builder: (context, state) {
              if (state.isSuccess) {
                List rooms = state.listRoomModel!.rooms;
                return ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < rooms.length; i++)
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 16.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      height: 257.h,
                                      child: PageView(
                                          controller: controller,
                                          children: [
                                            for (int j = 0;
                                                j < rooms[i].imageUrls.length;
                                                j++)
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 343.w,
                                                    height: 257.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.r)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      child: Image.network(
                                                        rooms[i].imageUrls[j],
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
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: SmoothPageIndicator(
                                          controller: controller,
                                          count: rooms[i].imageUrls.length,
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
                                  height: 8.h,
                                ),
                                Text(
                                  rooms[i].name,
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
                                Wrap(
                                  spacing: 8.w,
                                  runSpacing: 8.h,
                                  children: [
                                    for (int j = 0;
                                        j < rooms[i].peculiarities.length;
                                        j++)
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 5.h),
                                          decoration: const BoxDecoration(
                                              color: Color(0xFFFBFBFC)),
                                          child: Text(
                                            rooms[i].peculiarities[j],
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
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5.h,
                                          bottom: 5.h,
                                          left: 10.w,
                                          right: 2.w),
                                      decoration: BoxDecoration(
                                          color: Color(0x190D72FF),
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Подробнее о номере',
                                            style: TextStyle(
                                              color: Color(0xFF0D72FF),
                                              fontSize: 14.sp,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 174,
                                      child: FittedBox(
                                        alignment: Alignment.bottomLeft,
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'от ${rooms[i].price} ₽',
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
                                      rooms[i].pricePer,
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
                                ),
                                Container(
                                  width: 343.w,
                                  child: CupertinoButton(
                                    child: Text('Выбрать номер'),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderScreen()));
                                    },
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
