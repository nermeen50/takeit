import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_room_app/screens/widgets/custom_text.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

void modalBottomSheetMenu(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 1, left: 10, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsUtils.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: 'call 544852588',
                    fontWeight: FontWeight.bold,
                    textColor: ColorsUtils.primaryGreen,
                  ),
                  Icon(Icons.call),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsUtils.whiteColor,
              ),
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: CustomText(
                  text: 'Cancel',
                  fontWeight: FontWeight.bold,
                  textColor: ColorsUtils.primaryGreen,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        );
      });
}
