import 'package:equatable/equatable.dart';

class Conversation extends Equatable {
  final String _name;
  final String _conversationId;
  final int _unreadMessages;

  const Conversation({required name, required conversationId, required unreadMessages}) :
    _name = name, _conversationId = conversationId, _unreadMessages = unreadMessages;

  @override
  List<Object?> get props => [_name, _conversationId, _unreadMessages];

  String get name => _name;

  int get unreadMessages => _unreadMessages;

  String get conversationId => _conversationId;

  @override
  String toString() {
    return 'Conversation{_name: $_name, _conversationId: $_conversationId, _unreadMessages: $_unreadMessages}';
  }
}
