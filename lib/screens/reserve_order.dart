import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/reserve_datails.dart';
import 'package:v_room_app/screens/widgets/CustomListTitle.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_rounded_btn.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/screens/widgets/custom_textfield.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReserveOrder extends StatefulWidget {
  @override
  _ReserveOrderState createState() => _ReserveOrderState();
}

class _ReserveOrderState extends State<ReserveOrder> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtils.homeBackGroundColor,
      appBar: CustomAppBar(
        title: 'حجز',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: IntrinsicHeight(
                child: Card(
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
            Container(
              color: ColorsUtils.whiteColor,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomListTitle(
                    iconData: Icons.access_time,
                    title: 'الوقت المتبقي',
                    trailing: CustomText(
                      text: '04:30',
                    ),
                  ),
                  CustomText(
                    text: 'الخصوصيه',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text:
                        'معلومات عن المطعم معلومات عن المطعم معلومات عن المطعم',
                  ),
                  CustomText(
                    text:
                        'معلومات عن المطعم معلومات عن المطعم معلومات عن المطعم',
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
                    text: 'طلب خاص',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    isNotes: true,
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
            SizedBox(
              height: 20.h,
            ),
            Container(
              color: ColorsUtils.whiteColor,
              child: Column(
                children: [
                  CustomListTitle(
                    title: 'الضيوف',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        CustomText(
                          text: 'اضافه ضيف',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorsUtils.primaryGreen.withOpacity(0.2),
                            spreadRadius: 10,
                            blurRadius: 1,
                            offset: Offset(0, -2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: ColorsUtils.primaryGreen),
                    child: Icon(
                      Icons.person,
                      color: ColorsUtils.whiteColor,
                    ),
                  ),
                  CustomText(
                    text: 'لا يوجد ضيوف',
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: Text("موافقه علي كل الشروط"),
            value: rememberMe,
            onChanged: (newValue) {
              setState(() {
                rememberMe = newValue;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Container(
            height: 48,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CustomRoundedButton(
              load: false,
              backgroundColor: ColorsUtils.primaryGreen,
              borderColor: ColorsUtils.primaryGreen,
              pressed: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(30),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorsUtils.primaryGreen
                                        .withOpacity(0.2),
                                    spreadRadius: 10,
                                    blurRadius: 1,
                                    offset: Offset(0, -2),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(50),
                                color: ColorsUtils.primaryGreen),
                            child: Icon(
                              Icons.person,
                              color: ColorsUtils.whiteColor,
                            ),
                          ),
                          Text('تم إنشاء الحجز الخاص بك بنجاح'),
                          Text('هل ترغب في إضافة إلى التقويم?'),
                        ],
                      ),
                      actions: <Widget>[
                        Container(
                          width: 150.w,
                          height: 70.h,
                          child: CustomRoundedButton(
                            text: 'اضافه الي التقويم',
                            backgroundColor: ColorsUtils.primaryGreen,
                            borderColor: ColorsUtils.primaryGreen,
                            textColor: ColorsUtils.whiteColor,
                            load: false,
                            pressed: () {
                              Get.to(() => ReserveDetails());
                            },
                          ),
                        ),
                        Container(
                          width: 150.w,
                          height: 70.h,
                          child: CustomRoundedButton(
                            text: 'إلغاء الإضافة',
                            backgroundColor: ColorsUtils.whiteColor,
                            borderColor: ColorsUtils.whiteColor,
                            textColor: ColorsUtils.primaryGreen,
                            load: false,
                            pressed: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              text: 'حجز',
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
