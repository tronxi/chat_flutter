import 'package:json_annotation/json_annotation.dart';

part 'conversations_response.g.dart';

@JsonSerializable()
class ConversationResponse {
  final String conversationId;
  final String name;
  final int unreadMessages;

  const ConversationResponse({required this.conversationId, required this.name, required this.unreadMessages});

  factory ConversationResponse.fromJson(Map<String, dynamic> json) => _$ConversationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationResponseToJson(this);
}
