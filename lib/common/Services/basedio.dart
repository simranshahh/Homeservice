// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nb_utils/nb_utils.dart';
import '../config/my_config.dart';
import '../helper/constants.dart';
import 'app_navigator_service.dart';

class Api {
  final Dio api = Dio();

  final dio = createDio();

  final tokenDio = Dio(BaseOptions(baseUrl: MyConfig.appUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    // String accesstoken = StorageUtil.getString(access);
    var dio = Dio(BaseOptions(
      baseUrl: MyConfig.appUrl,
      receiveTimeout: 30000, // 15 seconds
      connectTimeout: 30000,
      sendTimeout: 30000,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        print(e.message);
        print(e.response!.statusCode);

        return handler.next(e);
      },
    ));
    // dio.options.headers = {
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Authorization': 'Bearer $accesstoken',
    // };
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.post<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("Post " + response.data);

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
      // } catch (e) {
      //   print("errr: ${e.toString()}");

      //   Fluttertoast.showToast(
      //     msg: e.toString(),
      //   );
      //   rethrow;
    }
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.get<String>(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      // refreshToken();
      throw const FormatException("Unable to get the data");
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.put<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to get the data");
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
      );
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    Future? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.delete<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to delete the data");
    } catch (e) {
      rethrow;
    }
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = getStringAsync(accessToken);
    // print(token);
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDQ2YmMzZTY3ZjRlYWNmZTc0ODcxOWUiLCJyb2xlIjoiNjQ0NmJiZGY2N2Y0ZWFjZmU3NDg3MTk1IiwiaWF0IjoxNjgyNTY3MTEyLCJleHAiOjE2ODI2NTM1MTJ9.sfWtfECT3cqO1yNGsx-w4cp51b5zluws6AXDgElnek8";

    options.headers.addAll({
      "Authorization": "Bearer $token",
      'content-Type': 'application/json',
      "validateStatus": (_) => true,
    });
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.type);
    print(err.response);
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions, "");
      case DioErrorType.response:
        String errorMsg = json.decode(err.response.toString())["message"];
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, errorMsg);
          case 401:
            throw UnauthorizedException(err.requestOptions, errorMsg);
          case 404:
            throw NotFoundException(err.requestOptions, errorMsg);
          case 409:
            throw ConflictException(err.requestOptions, errorMsg);
          case 500:
            throw InternalServerErrorException(err.requestOptions, errorMsg);
        }
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions, errorMessage);
      case DioErrorType.cancel:
        break;
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    AppNavigatorService.pushNamedAndRemoveUntil("Signin");
    return error.toString();
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);
  @override
  String toString() {
    return error.toString();
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}
