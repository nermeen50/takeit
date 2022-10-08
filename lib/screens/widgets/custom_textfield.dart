import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String lablel;
  Widget icon;
  Widget sufficIcon;
  Color filledColor;
  bool isMobile;
  bool centerText;
  TextEditingController controller;

  bool hasPassword;
  bool isEmail;
  bool passwordIdentical;
  bool isPhoneCode;
  bool isFinal;
  bool isEditable;
  bool isNotes;
  bool hasBorder;
  Function onFieldSubmitted;
  Function onChanged;
  Function onSaved;
  bool readOnly;
  TextStyle style;
  Function validator;
  String hintText;
  String initialValue;
  TextStyle hintStyle;
  Key key;

  CustomTextField(
      {this.icon,
      this.lablel,
      this.filledColor,
      this.hasBorder = true,
      this.isEditable = true,
      this.isNotes = false,
      this.centerText = false,
      this.isFinal = false,
      this.isPhoneCode = false,
      this.isMobile = false,
      this.isEmail = false,
      this.passwordIdentical,
      this.hasPassword = false,
      this.controller,
      this.sufficIcon,
      this.onFieldSubmitted,
      this.onChanged,
      this.onSaved,
      this.readOnly,
      this.style,
      this.validator,
      this.hintText,
      this.initialValue,
      this.hintStyle,
      this.key});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  List<String> codes = ['+20', '+966'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var phoneCodeProvider = Provider.of<PhoneCodeProvider>(context);
    return TextFormField(
      key: widget.key,
      initialValue: widget.initialValue,
      validator: widget.validator,
      readOnly: widget.readOnly ?? false,
      style: widget.style,
      controller: widget.controller,
      enabled: widget.isEditable,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      textInputAction: TextInputAction.next,
      obscureText: (widget.hasPassword) ? showPassword : widget.hasPassword,
      maxLines: (widget.isNotes) ? 3 : 1,
      textAlign: (widget.centerText) ? TextAlign.center : TextAlign.left,
      keyboardType: (widget.isEmail)
          ? TextInputType.emailAddress
          : (widget.isMobile)
              ? TextInputType.phone
              : TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        contentPadding: EdgeInsets.all(5),
        enabledBorder: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsUtils.borderColor)),
        disabledBorder: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsUtils.borderColor)),
        border: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsUtils.borderColor)),
        focusedBorder: (!widget.hasBorder)
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorsUtils.borderColor)),
        labelText: widget.lablel,
        labelStyle: TextStyle(color: ColorsUtils.onBoardingTextGrey),
        prefixIcon: widget.icon,
        fillColor: (widget.filledColor == null)
            ? Colors.transparent
            : widget.filledColor,
        filled: true,
        suffixIcon: (widget.hasPassword)
            ? InkWell(
                onTap: () {
                  showPassword = !showPassword;
                  setState(() {});
                },
                child: (!showPassword)
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : (!widget.isPhoneCode)
                ? widget.sufficIcon
                : Directionality(
                    textDirection: TextDirection.ltr,
                    child: CountryCodePicker(
                      onChanged: (v) {
                        // phoneCodeProvider.setPhoneCode(v.dialCode);
                      },
                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                      initialSelection: '+966',
                      favorite: [
                        '+966',
                        'EG',
                      ],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left

                      showFlagDialog: true,
                    ),
                  ),
      ),
    );
  }
}
