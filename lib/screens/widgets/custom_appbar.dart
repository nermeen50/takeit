import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final List<Widget> leading;
  final bool centerTitle;
  final Color backgroundColor;
  final double leadingWidth;
  final IconData leadingIcon, actionIcon;
  final Function leadingPress, actionPress;
  final double elevation;
  CustomAppBar({
    this.title,
    this.leading,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
    this.leadingWidth,
    this.leadingIcon,
    this.actionIcon,
    this.leadingPress,
    this.actionPress,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      elevation: elevation,
      leading: leading == null
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                // textDirection: TextDirection.ltr,
                color: ColorsUtils.whiteColor,
              ))
          : Row(
              children: leading,
            ),
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      actions: actions,
      backgroundColor: backgroundColor ?? ColorsUtils.primaryGreen,
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize = Size.fromHeight(80.h);
}
