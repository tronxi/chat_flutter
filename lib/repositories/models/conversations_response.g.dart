// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationResponse _$ConversationResponseFromJson(
        Map<String, dynamic> json) =>
    ConversationResponse(
      conversationId: json['conversationId'] as String,
      name: json['name'] as String,
      unreadMessages: json['unreadMessages'] as int,
    );

Map<String, dynamic> _$ConversationResponseToJson(
        ConversationResponse instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'name': instance.name,
      'unreadMessages': instance.unreadMessages,
    };
