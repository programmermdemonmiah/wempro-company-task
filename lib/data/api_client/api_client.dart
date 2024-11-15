import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project/data/api_response/api_response.dart';

class ApiClient {
  final String appBaseUrl;
  static const String noInternetMessage = 'connection_to_api_server_failed';
  final int timeoutInSeconds = 20;
  late Dio instance;
  ApiClient({required this.appBaseUrl}) {
    init();
  }

  void init() {
    instance = Dio(BaseOptions(baseUrl: appBaseUrl));

    instance.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<ResponseModel<T?>> requestWrapper<T>(
      Future<ResponseModel<T?>> Function() run) async {
    try {
      return await run();
    } on Map catch (e) {
      // print("[API]MAP_EXCEPTION: $e");
      return ResponseModel<T?>(false, e["message"], null);
    } on SocketException catch (_) {
      return ResponseModel<T?>(false, "Network error!", null);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return ResponseModel<T?>(false, "Connection timeout", null);
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return ResponseModel<T?>(false, "Receive timeout", null);
      } else if (e.type == DioExceptionType.connectionError) {
        return ResponseModel<T?>(false, "Connection error", null);
      } else if (e.type == DioExceptionType.sendTimeout) {
        return ResponseModel<T?>(false, "Connection failed.", null);
      } else if (e.type == DioExceptionType.cancel) {
        return ResponseModel<T?>(false, "Connection cancelled", null);
      } else if (e.response?.data != null) {
        if (e.response?.data is String) {
          return ResponseModel<T?>(false, e.response?.data, null);
        }
        return ResponseModel<T?>(
            false,
            e.response?.data?["message"] ??
                e.response?.statusMessage ??
                "Something went wrong!",
            null);
      } else {
        return ResponseModel<T?>(false, "Something went wrong!", null);
      }
    } catch (e) {
      debugPrint("[API]EXCEPTION:: $e");
      return ResponseModel<T?>(false, e.toString(), null);
    }
  }
}
