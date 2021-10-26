import 'package:bravo/exceptions/http_exception.dart';
import 'package:bravo/models/user_register.dart';
import 'package:bravo/provider/user_register_provider.dart';
import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListUsers extends StatefulWidget {
  final UserRegister users;
  const ListUsers({Key? key, required this.users}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
 Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
    
    if(widget.users.name == ''){
      Navigator.of(context).pushNamed(
                                Routes.formorhome,
                              );
    }else{
      Navigator.of(context).pushNamed(
                                Routes.home,
                              );
    }
     return Container(child: Text('aqui'),);
    
    /* SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListTile(
                    title: Text(
                      'Nome: ' + widget.users.name + '\n',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      'Número de telefone: ' +
                          widget.users.id +
                          '\nDecúbito Atual: ' +
                          widget.users.id,
                      style: TextStyle(fontSize: 16),
                    ),
                    isThreeLine: true,
                    trailing: Container(
                        padding: EdgeInsets.only(left: 3),
                        width: 130,
                        child: Row(children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () {
                              showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text('Excluir Pessoa'),
                                  content: Text('Tem certeza?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Não'),
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(false),
                                    ),
                                    TextButton(
                                      child: Text('Sim'),
                                      onPressed: () =>
                                          Navigator.of(ctx).pop(true),
                                    ),
                                  ],
                                ),
                              ).then((value) async {
                                if (value ?? false) {
                                  try {
                                    await Provider.of<UserRegisterProvider>(
                                      context,
                                      listen: false,
                                    ).removeProduct(widget.users);
                                  } on HttpException catch (error) {
                                    msg.showSnackBar(
                                      SnackBar(
                                        content: Text(error.toString()),
                                      ),
                                    );
                                  }
                                }
                              });
                            },
                          ),
                        ]))),
              ),
            ],
          ),
        ),
      ),
    );  */
  }
}
