import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fl_school/src/data/models/response_model.dart';
import 'package:fl_school/src/data/network/api_status_code.dart';
import 'package:fl_school/src/utility/app_util.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';

part 'api_endpoints.dart';

part 'exceptions.dart';

abstract class HttpServiceConst {
  static const int post = 0;
  static const int get = 1;
  static const int delete = 2;
  static const int put = 3;
}

class HttpService {
  late Dio _dio;

  HttpService() {
    _dio = Dio();
  }

  Future<ResponseModel> request({
    required String fullUrl,
    int requestType = HttpServiceConst.post,
    Map<String, dynamic>? body,
    Map<String, String>? customHeaders,
    bool useTokenInBody = true,
  }) async {
    ResponseModel responseModel = ResponseModel();
    Response response;
    try {
      Map<String, dynamic> map = body ?? {};
      Map<String, String> headers = customHeaders ?? getHeaders();

      printLog("Hit Api Url 😛 ==> $fullUrl");
      printLog("Hit Api Body 😛 ==> $map");
      printLog("Api Headers ==> $headers");
      response = await _checkRequest(
        fullUrl: fullUrl,
        requestType: requestType,
        body: map,
        headers: headers,
      );
      printLog("Dio Response : $fullUrl ${response.data}");
      responseModel.data = response.data;
    } on SocketException catch (e) {
      blocLog(bloc: "Error message for", msg: "$fullUrl: ${e.message}");
      blocLog(bloc: "Error Status Code ", msg: "SocketException");
      throw SocketException(e.message);
    } on DioError catch (e) {
      blocLog(bloc: "Error message for", msg: "$fullUrl: ${e.message}");
      blocLog(bloc: "Error response for $fullUrl ", msg: "${e.response?.data}");
      blocLog(bloc: "Error Status Code ", msg: "${e.response?.statusCode}");
    }
    return responseModel;
  }

  Future<Response> _checkRequest({
    required String fullUrl,
    required int requestType,
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) async {
    if (requestType == HttpServiceConst.get) {
      printLog("Hit Request Type 😛 ==> get");
      return await _dio.get(
        fullUrl,
        options: Options(headers: headers),
        queryParameters: body,
      );
    } else if (requestType == HttpServiceConst.post) {
      printLog("Hit Request Type 😛 ==> post");
      return await _dio.post(fullUrl,
          data: body, options: Options(headers: headers));
    } else if (requestType == HttpServiceConst.delete) {
      printLog("Hit Request Type 😛 ==> delete");
      return await _dio.delete(fullUrl,
          data: body, options: Options(headers: headers));
    } else {
      printLog("Hit Request Type 😛 ==> patch");
      return await _dio.patch(fullUrl,
          data: body, options: Options(headers: headers));
    }
  }

  Map<String, String> getHeaders() {
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    return headers;
  }
}
