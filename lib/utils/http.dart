import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum RequestState { requesting, succeed, failed }

typedef StateCallback = void Function(RequestState);

typedef ErrorCallback = void Function(Exception);

class DioUtil {
  static const getMethod = 'GET';
  static const postMethod = 'POST';

  static DioUtil _instance;
  static Dio _dio;

  DioUtil._private({BaseOptions options}) {
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger());
  }

  factory DioUtil({BaseOptions options}) {
    if (_instance == null) {
      _instance = DioUtil._private(options: options);
    }
    return _instance;
  }

  Interceptors get interceptors => _dio.interceptors;

  void addInterceptor(Interceptor interceptor) => _dio.interceptors.add(interceptor);

  void wrapNewInterceptors(List<Interceptor> interceptors) {
    _dio.interceptors.clear();
    _dio.interceptors.addAll(interceptors);
  }

  Future<Response<T>> request<T>(
    String url, {
    String method = getMethod,
    Map param,
    Options opt,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    StateCallback stateCallback,
    ErrorCallback errorCallback,
  }) async {
    try {
      Response<T> response;

      _checkEmpty(stateCallback, () {
        stateCallback(RequestState.requesting);
      });

      if (method == getMethod) {
        if (param != null && param.isNotEmpty) {
          var sb = StringBuffer('?');
          param.forEach((key, value) {
            sb.write('$key=$value&');
          });
          url += sb.toString().substring(0, sb.length - 1);
        }
        response = await _dio.get(
          url,
          options: opt,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      } else if (method == postMethod) {
        response = param == null
            ? await _dio.post(
                url,
                options: opt,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onReceiveProgress,
              )
            : await _dio.post(
                url,
                queryParameters: param,
                options: opt,
                cancelToken: cancelToken,
                onSendProgress: onSendProgress,
                onReceiveProgress: onSendProgress,
              );
      }

      if (response.statusCode != HttpStatus.ok) {
        _checkEmpty(stateCallback, () {
          stateCallback(RequestState.failed);
        });

        _checkEmpty(errorCallback, () {
          errorCallback(Exception('network error, and status code is ${response.statusCode}'));
        });

        return null;
      }

      _checkEmpty(stateCallback, () {
        stateCallback(RequestState.succeed);
      });
      return response;
    } catch (e) {
      _checkEmpty(errorCallback, () {
        errorCallback(Exception(e.toString()));
      });

      _checkEmpty(stateCallback, () {
        stateCallback(RequestState.failed);
      });
      return null;
    }
  }

  _checkEmpty(Object o, Function action) {
    if (o != null) action();
  }
}
