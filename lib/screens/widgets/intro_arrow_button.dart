import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class IntroArrowButton extends StatelessWidget {
  IntroArrowButton({@required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        height: 50.46.w,
        width: 50.46.w,
        decoration: BoxDecoration(
          color: ColorsUtils.kPrimaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Image(
            image: AssetImage('assets/images/$image'),
          ),
        ),
      ),
    );
  }
}
