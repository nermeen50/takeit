import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Pay extends StatelessWidget {
  const Pay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الدفع',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: ColorsUtils.hintTextColor,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Icon(Icons.add, color: ColorsUtils.primaryGreen),
                    CustomText(
                      text: 'اضافه بطاقه',
                      textColor: ColorsUtils.primaryGreen,
                    )
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: ColorsUtils.darkGreyTextColor,
                        ),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10, top: 50),
                        child: Column(
                          children: [
                            CustomText(
                              text: '.... .... .... 2342',
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: CustomText(text: 'Expired:  11/12')),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Image.asset(
                                S.current.logoImage,
                                fit: BoxFit.fill,
                                height: 50.h,
                                width: 50.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
