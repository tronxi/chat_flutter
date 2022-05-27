import 'package:chat_flutter/widgets/form_fields.dart';
import 'package:flutter/material.dart';


class UserDataFields extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _passwordController;
  const UserDataFields({Key? key, required nameController, required passwordController})
      : _nameController = nameController, _passwordController = passwordController, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PrincipalTextField(
            controller: _nameController,
            iconData: Icons.person,
            text: "Usuario"
        ),
        const SizedBox(height: 10),
        PrincipalPasswordField(
            controller: _passwordController,
            iconData: Icons.password,
            text: "Contraseña"
        ),
      ],
    );
  }
}
