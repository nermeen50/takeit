import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ReserveDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الحجز 37737373',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorsUtils.whiteColor,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/logo.jpg'),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'تيك ات',
                            ),
                            TextButton(
                              onPressed: () {},
                              child: CustomText(
                                text: 'حظر',
                              ),
                            )
                          ],
                        ),
                        CustomText(
                          text: 'تيك ات',
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            CustomText(
                              text: ' تيك تيك تيك تيك  ات',
                            ),
                          ],
                        ),
                        Container(
                          // width: 150.w,
                          height: 50.h,
                          child: CustomRoundedButton(
                            text: 'حجز 2883883838',
                            backgroundColor: ColorsUtils.hintGrayColor,
                            borderColor: ColorsUtils.hintGrayColor,
                            textColor: ColorsUtils.whiteColor,
                            load: false,
                            pressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: IntrinsicHeight(
                      child: Card(
                          color: ColorsUtils.homeBackGroundColor,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.person),
                                    CustomText(
                                      text: 'شخص',
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: ColorsUtils.greyTextColor,
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.calendar_view_month_sharp),
                                    CustomText(
                                      text: 'tgtg',
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: ColorsUtils.greyTextColor,
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.calendar_today_outlined),
                                    CustomText(
                                      text: '10-19',
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: ColorsUtils.greyTextColor,
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.access_time),
                                    CustomText(
                                      text: '06:00Am',
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: ColorsUtils.greyTextColor,
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.home_work_rounded),
                                    CustomText(
                                      text: 'داخل المنزل',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  CustomListTitle(
                    title: 'يمكن تعديل الطلب قبل 8:0:4',
                    iconData: Icons.access_time,
                  ),
                  CustomListTitle(
                    title: 'يمكن الغاء الطلب قبل 8:0:4',
                    iconData: Icons.access_time,
                  ),
                  CustomListTitle(
                    iconData: Icons.call,
                    title: '',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomRoundedButton(
                          text: 'تعديل',
                          backgroundColor: Colors.transparent,
                          textColor: ColorsUtils.primaryGreen,
                          load: false,
                          pressed: () {},
                        ),
                        CustomRoundedButton(
                          text: 'الغاء',
                          backgroundColor: Colors.transparent,
                          textColor: ColorsUtils.primaryGreen,
                          load: false,
                          pressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: ColorsUtils.whiteColor,
              child: Column(
                children: [
                  ExpansionTile(
                    textColor: Colors.black,
                    leading: Icon(Icons.qr_code),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: CustomText(text: 'حجز بار كود'),
                    children: <Widget>[],
                  ),
                  ExpansionTile(
                    textColor: Colors.black,
                    leading: Icon(Icons.calendar_today),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: CustomText(text: 'اضافه الي التقويم'),
                    children: <Widget>[],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: ColorsUtils.whiteColor,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'ماهي المناسبه',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorsUtils.greyTextColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: CustomText(
                            text: 'اعياد ميلاد',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorsUtils.greyTextColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: CustomText(
                            text: 'حفلات زفاف',
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorsUtils.greyTextColor),
                              borderRadius: BorderRadius.circular(20)),
                          child: CustomText(
                            text: 'اجتماعات',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
