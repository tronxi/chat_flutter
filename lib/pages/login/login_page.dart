import 'package:chat_flutter/bloc/login_bloc.dart';
import 'package:chat_flutter/pages/login/login_form.dart';
import 'package:chat_flutter/routes.dart';
import 'package:chat_flutter/shared/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        //automaticallyImplyLeading: false
      ),
      body: BlocProvider(
        create: (BuildContext context) => LoginBloc(),
        child: const LoginPageContent(),
      )
    );
  }
}

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if(state is LoginInitial) {
            return LoginForm();
          }else if (state is LoginSuccess){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(RouteGenerator.conversationsPage);
            });
            return LoginForm();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Snackbar.showError(context, "Error en el login");
            });
            return LoginForm();
          }
        });
  }
}

