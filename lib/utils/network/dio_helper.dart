import 'package:dio/dio.dart';
import 'package:newsapp/utils/exceptions/dio_socket_exception.dart';

class DioHelper {
  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(_createInterceptors());
    return dio;
  }

  static InterceptorsWrapper _createInterceptors() {
    return InterceptorsWrapper(
      onError: (err, handler) async {
        if (err.type == DioExceptionType.connectionError ||
            err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.sendTimeout ||
            err.type == DioExceptionType.receiveTimeout) {
          return handler.next(
            DioSocketException(requestOptions: RequestOptions()),
          );
        }
        return handler.next(err);
      },
    );
  }
}
