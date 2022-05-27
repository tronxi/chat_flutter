import 'package:chat_flutter/pages/login/login_forms_buttons.dart';
import 'package:chat_flutter/widgets/user_data_fields.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: SizedBox(
          height: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  UserDataFields(
                      nameController: _nameController,
                      passwordController: _passwordController
                  ),
                  const SizedBox(height: 50),
                  LoginFormButtons(formKey: _key)
                ],
              )
          ),
        )
    );
  }
}



