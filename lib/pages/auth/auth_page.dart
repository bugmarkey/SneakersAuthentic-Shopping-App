import 'package:flutter/material.dart';
import 'package:ui_ux/pages/auth/login_page.dart';
import 'package:ui_ux/pages/auth/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(
        showRegisterpage: toggleScreens,
      );
    } else {
      return RegisterScreen(
        showLoginPage: toggleScreens,
      );
    }
  }
}
