import 'package:chat_flutter/models/user_login.dart';
import 'package:chat_flutter/shared/http_client.dart';
import 'package:chat_flutter/repositories/models/user_register_request.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class Error {}
class Success {}

class JoinRepository {
  Future<Either<Error, Success>> retrieve(UserLogin userLogin) async {
    try {
      Dio client = HttpClient().dio;
      final userLoginRequest = UserRegisterRequest(
          name: userLogin.name, password: userLogin.password);
      await client.post(
          "${HttpClient.baseUrl}/users", data: userLoginRequest.toJson());
      return Right(Success());
    } on DioError catch (e) {
      return Left(Error());
    }
  }
}
