import 'package:dio/dio.dart';

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: 'https://youtube.googleapis.com/youtube/v3/',
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
    headers: {
      "Accept": "application/json",
    },
    validateStatus: (status) {
      return status != null && status <= 500;
    },
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;
}
