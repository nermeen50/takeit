import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final Function pressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Icon icon;
  final double width;
  final double height;
  final bool iconLeft;
  final bool load;
  final double fontSize;
  CustomRoundedButton(
      {this.pressed,
      this.text,
      this.backgroundColor,
      this.borderColor,
      this.icon,
      this.textColor,
      this.width,
      this.iconLeft = false,
      this.height,
      this.fontSize,
      this.load});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed ?? () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsUtils.kButtonPrimaryColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: borderColor ?? ColorsUtils.transparentColor,
          ),
        ),
        child: load
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : iconLeft
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (icon == null) ? Container() : icon,
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w800,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w800,
                          fontSize: fontSize ?? ScreenUtil().setSp(15),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      (icon == null) ? Container() : icon
                    ],
                  ),
      ),
    );
  }
}
