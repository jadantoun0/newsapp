import 'package:dio/dio.dart';

class DioSocketException extends DioException {
  DioSocketException({required super.requestOptions});
}
