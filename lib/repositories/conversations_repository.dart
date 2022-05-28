
import 'package:chat_flutter/repositories/models/conversations_response.dart';
import 'package:chat_flutter/shared/http_client.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class Error {}
class Success {
  final List<ConversationResponse> _conversations;
  Success({conversations}) : _conversations = conversations;
  List<ConversationResponse> get conversations => _conversations;
}

class ConversationsRepository {
  Future<Either<Error, Success>> retrieve(String userId) async {
    try {
      Dio client = HttpClient().dio;
      final response = await client.get("${HttpClient.baseUrl}users/$userId/conversations");
      List<ConversationResponse> conversations = (response.data as List)
          .map((e) => ConversationResponse.fromJson(e))
          .toList();
      return Right(Success(conversations: conversations));
    } on DioError {
      return Left(Error());
    }
  }
}
