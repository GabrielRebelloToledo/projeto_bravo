import 'package:bravo/models/auth.dart';
import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Seja bem Vindo!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Novas Solicitações'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.home,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Cadastro Entregador'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.cadastro,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar Usuários'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.usuarios,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();

              Navigator.of(context).pushReplacementNamed(
                Routes.authOrHome,
              );
            },
          ),
        ],
      ),
    );
  }
}
