import 'package:dio/dio.dart';

class HttpClient {
  late final Dio _dio;
  static const baseUrl = "https://tronxi.ddns.net/chat-nginx/";
  HttpClient._() {
    _dio = Dio();
  }

  static final HttpClient _instance = HttpClient._();

  factory HttpClient() {
    return _instance;
  }

  Dio get dio => _dio;
}
