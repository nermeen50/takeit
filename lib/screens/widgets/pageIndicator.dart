import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator(this.selectedIndex);
  int selectedIndex;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
      for (int i = 0; i < 3; i++) {
        list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      );
  }
  Widget _indicator(bool isActive) {
    return Container(
      height: 20.h,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
        height: 10.h,
        width: 10.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? ColorsUtils.kPrimaryColor:Color(0xFFE6E6E6) ,
        ),
      ),
    );
  }
}
