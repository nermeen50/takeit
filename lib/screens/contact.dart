import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'رجوع',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.h,
              width: double.infinity,
              child: Image.asset(
                S.current.logoImage,
                fit: BoxFit.fill,
              ),
            ),
            CustomText(
              text:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border:
                                Border.all(color: ColorsUtils.greyTextColor)),
                      ),
                      CustomText(text: 'Takeit'),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.facebook_outlined,
                        size: 70.h,
                      ),
                      CustomText(text: 'Takeit'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
