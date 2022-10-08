import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:v_room_app/utils/PreferenceManger.dart';
import 'package:v_room_app/utils/TokenUtil.dart';

import '../ServicesURLs.dart';

class ApiClient {
  static Future<Map<String, String>> headers() async {
    var mHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    var token = await PreferenceManager.getInstance().getString('token');
    if (token != '') {
      mHeaders[HttpHeaders.authorizationHeader] = "Bearer ${token}";
    }
    return mHeaders;
  }

  static Future<Response> getRequest(
      String endPoint, Map<String, dynamic> queryParams) async {
    Map<String, String> header = await headers();

    //create url with (baseUrl + endPoint) and query Params if any
    Uri url = Uri(
      scheme: ServicesURLs.development_environment_scheme,
      host: ServicesURLs.development_environment_without_http,
      //port: ServicesURLs.development_environment_port,
      path: endPoint,
      queryParameters: queryParams,
    );
    //String url = ServicesURLs.development_environment + endPoint;
    //network logger
    log(url.toString() + "\n" + header.toString());
    //print(url.queryParameters.toString());
    //GET network request call
    final response = await http.get(url, headers: header);

    return response;
  }

  static Future<http.Response> postRequest(String endPoint, dynamic requestBody,
      {bool isMultipart = false,
      List<http.MultipartFile> multiPartValues}) async {
    Map<String, String> header = await headers();
    //create url of (baseUrl + endPoint)
    String url = ServicesURLs.development_environment + endPoint;
    //network logger
    print(url + "\n" + header.toString());
    if (requestBody != null) log(requestBody.toString());
    //POST network request call

    var response;
    if (!isMultipart) {
      response =
          await http.post(Uri.parse(url), headers: header, body: requestBody);
    } else {
      log("*****MultiPartRequest*****");
      var uri = Uri.parse(url);
      Map<String, dynamic> p = jsonDecode(requestBody);
      Map<String, String> convertedMap = {};
      p.forEach((key, value) {
        convertedMap[key] = value;
      });

      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(header)
        ..fields.addAll(convertedMap)
        ..files.addAll(multiPartValues);

      response = await http.Response.fromStream(await request.send());
    }

    return response;
  }

  static Future<http.Response> putRequest(String endPoint, dynamic requestBody,
      {bool isMultipart = false,
      List<http.MultipartFile> multiPartValues}) async {
    Map<String, String> header = await headers();

    //create url of (baseUrl + endPoint)
    String url = ServicesURLs.development_environment + endPoint;
    //network logger
    print(url + "\n" + header.toString());
    if (requestBody != null) log(requestBody.toString());
    //POST network request call

    var response;
    if (!isMultipart) {
      response =
          await http.put(Uri.parse(url), headers: header, body: requestBody);
    } else {
      log("****MultiPart*****");
      var uri = Uri.parse(url);
      Map<String, dynamic> p = jsonDecode(requestBody);
      Map<String, String> convertedMap = {};
      p.forEach((key, value) {
        convertedMap[key] = value;
      });

      var request = http.MultipartRequest('PUT', uri)
        ..headers.addAll(header)
        ..fields.addAll(convertedMap)
        ..files.addAll(multiPartValues);

      response = await http.Response.fromStream(await request.send());
    }

    return response;
  }

  static Future<Response> deleteRequest(
      String endPoint, Map<String, dynamic> queryParams) async {
    Map<String, String> header = await headers();

    //create url with (baseUrl + endPoint) and query Params if any
    Uri url = Uri(
      scheme: ServicesURLs.development_environment_scheme,
      host: ServicesURLs.development_environment_without_http,
      //port: ServicesURLs.development_environment_port,
      path: endPoint,
      queryParameters: queryParams,
    );
    //String url = ServicesURLs.development_environment + endPoint;
    //network logger
    log(url.toString() + "\n" + header.toString());
    //print(url.queryParameters.toString());
    //GET network request call
    final response = await http.delete(url, headers: header);

    return response;
  }
}
