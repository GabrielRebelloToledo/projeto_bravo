import 'dart:html';
import 'dart:io';
import 'package:bravo/models/auth.dart';
import 'package:bravo/models/pessoa.dart';
import 'package:bravo/provider/pessoas.dart';
import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPessoa extends StatefulWidget {
  final Pessoa pessoa;

  ListPessoa({
    Key? key,
    required this.pessoa,
  }) : super(key: key);

  @override
  _ListPessoaState createState() => _ListPessoaState();
}

class _ListPessoaState extends State<ListPessoa> {
  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);

    return widget.pessoa.userid != ''
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                          title: Text(
                            'Nome: ' + widget.pessoa.name + '\n',
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: Text(
                            'Quantidade de pessoas: ' +
                                widget.pessoa.pessoas.toString() +
                                '\nData da reserva: ' +
                                widget.pessoa.datas 
                                ,
                            style: TextStyle(fontSize: 16),
                          ),
                          isThreeLine: true,
                          trailing: Container(
                              padding: EdgeInsets.only(left: 3),
                              width: 130,
                              child: Row(children: [
                                /* IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.green,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      Routes.cadastroP,
                                      arguments: widget.pessoa,
                                    );
                                  },
                                ), */
                              ElevatedButton(
                            child: Text('Concluir?'),
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
                                    await Provider.of<ProductList>(
                                      context,
                                      listen: false,
                                    ).concluido(widget.pessoa);
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
          )
        : Container();
  }
}
