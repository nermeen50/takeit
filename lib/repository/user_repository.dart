import 'dart:convert';
import 'package:v_room_app/models/response/account_model.dart';
import 'package:v_room_app/models/response/available_dates.dart';
import 'package:v_room_app/models/response/booking_model.dart';
import 'package:v_room_app/models/response/change_password_model.dart';
import 'package:v_room_app/models/response/details_orders_model.dart';
import 'package:v_room_app/models/response/login_model.dart';
import 'package:v_room_app/models/response/map_model.dart';
import 'package:v_room_app/models/response/orders_model.dart';
import 'package:v_room_app/models/response/resturant_model.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/network/networkCallback/NetworkCallback.dart';
import 'package:v_room_app/utils/Enums.dart';

class UserRepository {
  Future<UserModel> registerRequest(
      String name, String phoneNum, String password) async {
    var data = jsonEncode(<String, String>{
      "name": name,
      "login": phoneNum,
      "password": password,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/register',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> activteRequest(String userPhone, String activateKey) async {
    Map<String, dynamic> data = {
      "userLogin": userPhone,
      "key": activateKey,
    };
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/activate',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<LoginModel> loginRequest(
      String password, String username, bool rememberMe) async {
    var data = jsonEncode(<String, dynamic>{
      "password": password,
      "rememberMe": rememberMe,
      'username': username
    });
    return LoginModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/authenticate',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> forgetPasswordRequest(String userPhone) async {
    var data = jsonEncode(<String, dynamic>{
      "login": userPhone,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account/reset-password/init',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<UserModel> resetPasswordRequest(String key, String newPassword) async {
    var data = jsonEncode(<String, dynamic>{
      "key": key,
      "newPassword": newPassword,
    });
    return UserModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/account/reset-password/finish',
      method: HttpMethod.POST,
      requestBody: data,
    ));
  }

  Future<MapListModel> getLatLogMap(String latLong) async {
    Map<String, dynamic> data = {
      "latlong": latLong,
    };
    print(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/nearest',
      method: HttpMethod.GET,
      queryParams: data,
    ));
    return MapListModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/nearest',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<ResturantModel> resturantRequest(String resturantId) async {
    return ResturantModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/restaurants/${resturantId}',
      method: HttpMethod.GET,
    ));
  }

  Future<MapListModel> filtterRequest() async {
    return MapListModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/cuisines',
      method: HttpMethod.GET,
    ));
  }

  Future<BookingModel> bookingRequest(
      String datePicker, String numberOfGuests) async {
    Map<String, dynamic> data = {
      "date": datePicker,
      "guests": numberOfGuests,
    };
    return BookingModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/branch/1/available-slots',
      method: HttpMethod.GET,
      queryParams: data,
    ));
  }

  Future<AvailableDates> availableDatesRequest() async {
    return AvailableDates.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/branch/1/available-dates',
      method: HttpMethod.GET,
    ));
  }

  Future<AccountModel> accountRequest() async {
    return AccountModel.fromJson(await NetworkCall.makeCall(
        endPoint: 'api/account', method: HttpMethod.GET));
  }

  Future<ChangePasswordModel> changePasswordRequest(
      String currentPassword, String newPassword) async {
    var data = jsonEncode(<String, dynamic>{
      "currentPassword": currentPassword,
      "newPassword": newPassword,
    });
    return ChangePasswordModel.fromJson(await NetworkCall.makeCall(
        endPoint: 'api/account/change-password',
        method: HttpMethod.POST,
        requestBody: data));
  }

  Future<AccountModel> editProfileRequest(
    String name,
    email,
    langKey,
    createdBy,
    createdDate,
    lastModifiedBy,
    lastModifiedDate,
    login,
    userType,
    imageUrl,
    bool activated,
    int id,
  ) async {
    var data = jsonEncode(<String, dynamic>{
      "name": name,
      "email": email,
      "langKey": langKey,
      "createdBy": createdBy,
      "createdDate": createdDate,
      "lastModifiedBy": lastModifiedBy,
      "lastModifiedDate": lastModifiedDate,
      "login": login,
      "userType": userType,
      "imageUrl": imageUrl,
      "activated": activated,
      "id": id,
    });
    return AccountModel.fromJson(await NetworkCall.makeCall(
        endPoint: 'api/account', method: HttpMethod.POST, requestBody: data));
  }

  Future<OrdersModel> getAllOrdersRequest() async {
    return OrdersModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/auth/orders',
      method: HttpMethod.GET,
    ));
  }

  Future<DetailsOrdersModel> detailsOrdersRequest(int id) async {
    return DetailsOrdersModel.fromJson(await NetworkCall.makeCall(
      endPoint: 'api/auth/orders/${id}',
      method: HttpMethod.GET,
    ));
  }

  Future bookOrderRequest(int branchId, String dateTime, int numberOfGusts,
      int placeSectionId) async {
    var data = jsonEncode(<String, dynamic>{
      "branchId": branchId,
      "dateTime": dateTime,
      "numberOfGusts": numberOfGusts,
      "placeSectionId": placeSectionId,
    });

    return await NetworkCall.makeCall(
        endPoint: 'api/auth/orders',
        method: HttpMethod.POST,
        requestBody: data);
  }
}
