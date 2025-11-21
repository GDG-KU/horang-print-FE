import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:horang_print/app/api/api_error.dart';
import 'package:horang_print/app/api/result.dart';
import 'package:horang_print/app/api/sse_event.dart';
import 'package:horang_print/app/api/sse_transformer.dart';

class MyDio {
  final Dio dio;
  final _host = dotenv.env["API_ADDRESS"].toString();

  MyDio({required this.dio}) {
    dio.options.baseUrl = _host;
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  StreamTransformer<Uint8List, List<int>> unit8Transformer =
      StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      sink.add(List<int>.from(data));
    },
  );

  Future<Result<T>> _request<T>({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    Options? options,
    bool isEventStream = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options ??
            Options(
              method: method,
              headers: {
                "Accept-Encoding": "*",
                "User-Agent":
                    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36"
              },
            ),
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      if (isEventStream) {
        return Result.success(response.data.stream
            .transform(unit8Transformer)
            .transform(const Utf8Decoder())
            .transform(const LineSplitter())
            .transform(SseTransformer()));
      }
      if (fromJson != null) {
        return Result.success(fromJson(response.data));
      } else {
        return Result.success(response.data as T);
      }
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        return Result.requestCancelled();
      }
      return Result.failure(ApiError.fromDioError(e));
    } catch (e) {
      return Result.failure(ApiError.unknown(e));
    }
  }

  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _request<T>(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      fromJson: fromJson,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Result<Stream<SseEvent>>> getEventStream<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    return _request(
      path: path,
      method: 'GET',
      queryParameters: queryParameters,
      options: Options(
        responseType: ResponseType.stream,
        receiveTimeout: const Duration(minutes: 30),
        method: 'GET',
      ),
      isEventStream: true,
      cancelToken: cancelToken,
    );
  }

  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _request<T>(
      path: path,
      method: 'POST',
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Result<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _request<T>(
      path: path,
      method: 'PUT',
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Result<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    return _request<T>(
      path: path,
      method: 'DELETE',
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  Future<Result<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _request<T>(
      path: path,
      method: 'PATCH',
      data: data,
      queryParameters: queryParameters,
      fromJson: fromJson,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
