import 'package:chat_flutter/models/conversations.dart';
import 'package:chat_flutter/repositories/conversations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ConversationsEvent {}
class ConversationsRetrieve extends ConversationsEvent {
  final String _userId;
  ConversationsRetrieve({userId}) : _userId = userId;
  String get userId => _userId;
}

abstract class ConversationsState {}
class ConversationsInitial extends ConversationsState {}
class ConversationsFailure extends ConversationsState {}
class ConversationsRetrieved extends ConversationsState {
  final List<Conversation> _conversations;
  ConversationsRetrieved({required conversations}) : _conversations = conversations;

  List<Conversation> get conversations => _conversations;
}

class ConversationsBloc extends Bloc<ConversationsEvent, ConversationsState> {
  late final ConversationsRepository _conversationsRepository;

  ConversationsBloc() : super(ConversationsInitial()) {
    _conversationsRepository = ConversationsRepository();
    on<ConversationsRetrieve>((event, emit) async => emit(await _onRetrieve(event.userId)));
  }

  Future<ConversationsState> _onRetrieve(String userId) async {
    final response = await _conversationsRepository.retrieve(userId);
    return response.fold((left) => ConversationsFailure(), (right) => _generateConversationsRetrieved(right));
  }

  ConversationsRetrieved _generateConversationsRetrieved(Success success) {
    List<Conversation> conversations = success.conversations
        .map((e) => Conversation(name: e.name, conversationId: e.conversationId, unreadMessages: e.unreadMessages))
        .toList();
    return ConversationsRetrieved(conversations: conversations);
  }
}
