import 'package:chat_flutter/routes.dart';
import 'package:chat_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';

class LoginFormButtons extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginFormButtons({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrimaryButton(
            onPressed: _onLoginPressed,
            text: "Login"
        ),
        const SizedBox(height: 10),
        SecondaryButton(
            onPressed: () => _onJoinPressed(context),
            text: "Registro"
        )
      ],
    );
  }
  void _onLoginPressed() {
    if (formKey.currentState?.validate() ?? false) {
    }
  }

  void _onJoinPressed(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.joinPage);
  }
}
