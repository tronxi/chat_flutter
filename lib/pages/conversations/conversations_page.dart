import 'package:chat_flutter/widgets/logout_app_bar.dart';
import 'package:flutter/material.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoutAppBar(
        context: context,
        title: "Conversaciones"
      ).build(),
      body: const Text("wip"),
    );
  }
}
