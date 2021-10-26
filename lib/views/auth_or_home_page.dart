import 'package:bravo/components/list_users.dart';
import 'package:bravo/models/auth.dart';
import 'package:bravo/views/auth_page.dart';
import 'package:bravo/views/form_or_home.dart';
import 'package:bravo/views/home.dart';
import 'package:bravo/views/new_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
 const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ?  UsersViews(): AuthPage();
        }
      },
    );
  }
}

