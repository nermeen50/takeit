import 'package:flutter/material.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';

class Constants {
  static const token = "Token";
  static const keyOnBoarding = "keyOnBoarding";

  static const unAuthorizedError = "Unauthorized Error";

  static const unAuthorizedUserMessage =
      "You are not authorized, please login first to proceed";

  static const languageCode = "language_code";

  static const countryCode = "countryCode";

  static OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: ColorsUtils.borderColor));
}
