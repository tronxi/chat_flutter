import 'package:chat_flutter/bloc/conversations_bloc.dart';
import 'package:chat_flutter/shared/snackbar.dart';
import 'package:chat_flutter/shared/token_service.dart';
import 'package:chat_flutter/widgets/logout_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoutAppBar(
        context: context,
        title: "Conversaciones"
      ).build(),
      body: BlocProvider(
        create: (BuildContext context) => ConversationsBloc(),
        child: const ConversationsPageContent(),
      ),
    );
  }
}

class ConversationsPageContent extends StatelessWidget {
  const ConversationsPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ConversationsBloc, ConversationsState>(
      builder: (context, state) {
        if(state is ConversationsInitial) {
          context.read<ConversationsBloc>().add(ConversationsRetrieve(userId: TokenService().retrieveUserId()));
          return const Center(child: CircularProgressIndicator());
        }else if (state is ConversationsRetrieved) {
          print(state.conversations);
          return const Text("ok");
        }else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Snackbar.showError(context, "Error al recuperar las conversaciones");
          });
          return const Center(child: CircularProgressIndicator());
        }
    });
  }
}

