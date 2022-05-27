import 'package:chat_flutter/bloc/join_bloc.dart';
import 'package:chat_flutter/models/user_login.dart';
import 'package:chat_flutter/routes.dart';
import 'package:chat_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinFormButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController passwordController;

  const JoinFormButtons({Key? key, required this.formKey,
    required this.nameController,
    required this.passwordController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrimaryButton(
            onPressed:() => _onJoinPressed(context.read<JoinBloc>()),
            text: "Registrarse"
        ),
        const SizedBox(height: 10),
        SecondaryButton(
            onPressed: () => _onLoginPressed(context),
            text: "Login"
        )
      ],
    );
  }
  void _onLoginPressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
  }

  void _onJoinPressed(JoinBloc joinBloc) {
    if (formKey.currentState?.validate() ?? false) {
      final user = UserLogin(name: nameController.value.text, password: passwordController.value.text);
      joinBloc.add(JoinEvent(user: user));
    }
  }
}
