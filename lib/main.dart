import 'package:chat_flutter/pages/login/login_page.dart';
import 'package:chat_flutter/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Chat',
        theme: ThemeData(
          primarySwatch: Colors.cyan
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.cyan,
          brightness: Brightness.dark
        ),
        themeMode: ThemeMode.system,
        home: const LoginPage(),
        initialRoute: RouteGenerator.loginPage,
        onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
