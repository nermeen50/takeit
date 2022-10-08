import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class ChoiceButton extends StatelessWidget {
  final String right;
  final String left;
  final Color rightColor;
  final Color leftColor;
  final Color rightText;
  final Color leftText;
  final VoidCallback rightTap;
  final VoidCallback leftTap;
  final double en;
  final double ar;
  ChoiceButton(
      {this.right,
      this.left,
      this.rightColor,
      this.leftColor,
      this.leftText,
      this.rightText,
      this.rightTap,
      this.leftTap,
      this.ar,
      this.en});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: rightTap,
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
              color: rightColor,
              border: Border.all(
                color: ColorsUtils.primaryYellow,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(ar),
                bottomRight: Radius.circular(ar),
                bottomLeft: Radius.circular(en),
                topLeft: Radius.circular(en),
              ),
            ),
            child: Center(
              child: Text(
                right,
                style: GoogleFonts.cairo(color: rightText, fontSize: 14),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: leftTap,
          child: Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
              color: leftColor,
              border: Border.all(
                color: ColorsUtils.primaryYellow,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(en),
                bottomRight: Radius.circular(en),
                topLeft: Radius.circular(ar),
                bottomLeft: Radius.circular(ar),
              ),
            ),
            child: Center(
              child: Text(
                left,
                style: GoogleFonts.cairo(color: leftText, fontSize: 14),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
