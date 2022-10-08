import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class AppTextField extends StatelessWidget {
  final double sidePadding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fieldHeight;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool autofocus;
  final Color borderColor;
  final String errorText;
  final String hintText;
  final double borderRadius;
  final int maxLines;
  final int minLines;
  final Widget prefix;
  final Widget suffix;
  final Function onChange;
  final Function onSaved;
  final Function validator;
  final Color fillColor;
  AppTextField({
    this.autofocus,
    this.borderColor,
    this.controller,
    this.fieldHeight,
    this.errorText,
    this.hintText,
    this.borderRadius,
    this.isPassword,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.sidePadding,
    this.maxLines,
    this.minLines,
    this.onChange,
    this.onSaved,
    this.validator,
    this.horizontalPadding,
    this.verticalPadding,
    this.fillColor,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: sidePadding,
        right: sidePadding,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        autofocus: autofocus == null ? false : autofocus,
        minLines: minLines == null ? 1 : minLines,
        maxLines: maxLines == null ? 1 : maxLines,
        style: GoogleFonts.cairo(
            color: ColorsUtils.blackColor, fontSize: 14),
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal:horizontalPadding?? 5,vertical:verticalPadding?? 15),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                //color: ColorsUtils.primaryYellow,
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius)),
              borderSide: BorderSide(
                color: borderColor,
                width: 1,
                style: BorderStyle.solid,
              )),
          hintText: hintText,
          hintStyle: GoogleFonts.cairo(
              fontSize: 14, color: ColorsUtils.greyTextColor),
          errorStyle: GoogleFonts.cairo(color: Colors.red),
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
        onChanged: onChange,
        onSaved: onSaved,
        validator: validator,

      ),
    );
  }
}
