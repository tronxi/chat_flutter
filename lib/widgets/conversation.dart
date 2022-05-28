import 'package:chat_flutter/models/conversations.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class ConversationBox extends StatelessWidget {
  final Conversation _conversation;
  const ConversationBox({Key? key, required conversation})
     : _conversation = conversation, super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ListTile(
              trailing: _generateBadge(context),
              title: Text(
                _conversation.name,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            ChatButton(onPressed: _onPressedChat)
          ],
        )
      ),
    );
  }
  Widget _generateBadge(BuildContext context) {
    if(_conversation.unreadMessages == 0) {
      return const SizedBox.shrink();
    } else {
      return Badge(
        badgeColor: Theme.of(context).primaryColor,
        badgeContent: Text(_conversation.unreadMessages.toString()),
        child: const Icon(Icons.messenger),
      );
    }
  }
  void _onPressedChat(){

  }
}

class ChatButton extends StatelessWidget {
  final void Function() onPressed;
  const ChatButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        height: 30,
        child: ElevatedButton(
            onPressed: onPressed,
            child: const Text(
              "Chat",
              style: TextStyle(fontSize: 18),
            )
        )
    );
  }
}
