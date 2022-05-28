import 'package:chat_flutter/models/conversations.dart';
import 'package:chat_flutter/widgets/conversation.dart';
import 'package:flutter/material.dart';

class ConversationsList extends StatelessWidget {
  final List<Conversation> _conversations;
  const ConversationsList({Key? key, required conversations})
      : _conversations = conversations, super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> conversationsWidget = [];
    for(var conversation in _conversations) {
      conversationsWidget.add(ConversationBox(conversation: conversation));
    }
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 15,
            alignment: WrapAlignment.center,
            children: conversationsWidget,
          )
        )
      ),
    );
  }
}
