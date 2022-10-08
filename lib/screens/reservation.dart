import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:v_room_app/App/app_event.dart';
import 'package:v_room_app/App/app_state.dart';
import 'package:v_room_app/Blocs/home_bloc.dart';
import 'package:v_room_app/screens/Reserve_order.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'المتاح',
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomListTitle(
              title: 'فرع',
              iconData: Icons.home_work_outlined,
              trailing: CustomText(
                text: 'السلمانيه شارع 34 المتفرع من',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorsUtils.homeBackGroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TableCalendar(

                  // sixWeekMonthsEnforced: true,
                  calendarStyle: CalendarStyle(),
                  onCalendarCreated: (controller) =>
                      pageController = controller,
                  daysOfWeekHeight: 70.h,
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(1950),
                  lastDay: DateTime.now()),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CustomText(
                    text: '${DateTime.now()}',
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  CustomListTitle(
                                    title: 'عدد الاشخاص',
                                    iconData: Icons.person,
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.add)),
                                        CustomText(
                                          text: '1',
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.remove)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    height: 70.h,
                                    width: 150.w,
                                    child: CustomRoundedButton(
                                      load: false,
                                      backgroundColor: ColorsUtils.primaryGreen,
                                      borderColor: ColorsUtils.primaryGreen,
                                      pressed: () {
                                        Get.back();
                                      },
                                      text: 'done',
                                      fontSize: 20.sp,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorsUtils.greyTextColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          CustomText(
                            text: 'شخص : 1',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                text: 'داخل المنزل',
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.h,
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => ReserveOrder());
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          width: 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: ColorsUtils.primaryGreen)),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsUtils.primaryGreen,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                ),
                                width: double.infinity,
                                child: CustomText(
                                  text: '12:00 AM',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.date_range),
                                  CustomText(
                                    text: '120جنيه',
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  }),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                text: 'خارج المنزل',
              ),
            ),
            Container(
              width: double.infinity,
              height: 100.h,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(left: 10),
                        width: 150.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: ColorsUtils.primaryGreen)),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorsUtils.primaryGreen,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                              width: double.infinity,
                              child: CustomText(
                                text: '12:00 AM',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range),
                                CustomText(
                                  text: '120جنيه',
                                )
                              ],
                            )
                          ],
                        ));
                  }),
            )
          ],
        )));
  }
}
