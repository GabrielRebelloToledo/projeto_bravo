import 'package:bravo/core/models/bravo_user.dart';
import 'package:bravo/core/services/auth/auth_service.dart';
import 'package:bravo/pages/auth_page.dart';
import 'package:bravo/pages/chat_page.dart';
import 'package:bravo/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<BravoUser?>(
        stream: AuthService().userChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
