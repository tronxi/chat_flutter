import 'package:chat_flutter/pages/join/join_forms_buttons.dart';
import 'package:chat_flutter/widgets/user_data_fields.dart';
import 'package:flutter/material.dart';

class JoinForm extends StatelessWidget {
  JoinForm({Key? key}) : super(key: key);
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
                  JoinFormButtons(
                    formKey: _key,
                    nameController: _nameController,
                    passwordController: _passwordController,
                  )
                ],
              )
          ),
        )
    );
  }
}
