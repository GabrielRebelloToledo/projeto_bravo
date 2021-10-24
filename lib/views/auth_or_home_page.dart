import 'package:bravo/models/auth.dart';
import 'package:bravo/views/auth_page.dart';
import 'package:bravo/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const Home() : AuthPage();
  }
}
