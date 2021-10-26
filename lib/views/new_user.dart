import 'package:bravo/components/app_drawer.dart';
import 'package:bravo/components/list_users.dart';
import 'package:bravo/models/auth.dart';
import 'package:bravo/provider/user_register_provider.dart';
import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersViews extends StatefulWidget {
  const UsersViews({Key? key}) : super(key: key);

  @override
  _UsersViewsState createState() => _UsersViewsState();
}

class _UsersViewsState extends State<UsersViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.cadastro,
              );
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(
                Routes.authOrHome,
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.cadastro);
        },
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<UserRegisterProvider>(context, listen: false)
            .loadProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data != null) {
            return Center(
              child: Text('Ocorreu um erro!'),
            );
          } else {
            return Consumer<UserRegisterProvider>(
              builder: (ctx, orders, child) => ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: (ctx, i) => ListUsers(users: orders.items[i]),
              ),
            );
          }
        },
      ),
    );
  }
}
