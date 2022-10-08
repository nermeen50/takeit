import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:v_room_app/generated/l10n.dart';
import 'package:v_room_app/models/response/user_model.dart';
import 'package:v_room_app/network/client/ApiClient.dart';
import 'package:v_room_app/utils/Enums.dart';

class NetworkCall {
  static Future<Map<String, dynamic>> makeCall(
      {String endPoint,
      HttpMethod method,
      dynamic requestBody,
      Map<String, dynamic> queryParams,
      bool isMultipart = false,
      List<MultipartFile> multiPartValues}) async {
    try {
      Response response;
      if (method == HttpMethod.GET) {
        response = (await ApiClient.getRequest(endPoint, queryParams));
      } else if (method == HttpMethod.POST) {
        response = (await ApiClient.postRequest(endPoint, requestBody,
            isMultipart: isMultipart, multiPartValues: multiPartValues));
      } else if (method == HttpMethod.PUT) {
        response = (await ApiClient.putRequest(endPoint, requestBody,
            isMultipart: isMultipart, multiPartValues: multiPartValues));
      } else if (method == HttpMethod.DELETE) {
        response = (await ApiClient.deleteRequest(endPoint, queryParams));
      }

      if (response.statusCode == NetworkStatusCodes.OK_200.value ||
          response.statusCode == NetworkStatusCodes(201).value) {
        //Api logger
        log("Api Response: ${response.body}");
        return {"response": jsonDecode(response.body)};
      } else if (response.statusCode ==
              NetworkStatusCodes.ServerInternalError.value ||
          response.statusCode == NetworkStatusCodes.BadRequest.value) {
        //Api logger

        print(
            "API Error: ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        return {
          "status": false,
          "code": response.statusCode,
          'response': jsonDecode(response.body) as Map<String, dynamic>,
          "message": S.current.internal_server_error
        };
      } else if (response.statusCode ==
          NetworkStatusCodes.UnAuthorizedUser.value) {
        var result = jsonDecode(response.body) as Map<String, dynamic>;

        //Api logger
        print(
            "API Error: ${response.statusCode} - ${response.reasonPhrase} - $result");
        return {
          "status": false,
          "code": response.statusCode,
          "message": result['title']
        };
      } else {
        //Api logger
        print(
            "API Error: ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        return {
          "status": false,
          "code": response.statusCode,
          "message": response.reasonPhrase
        };
      }
    } on SocketException catch (_) {
      return {
        "status": false,
        "code": 0,
        "message": S.current.no_internet_connection
      };
    } on Exception catch (_) {
      return {"status": false, "code": 0, "message": _.toString()};
    }
  }
}
