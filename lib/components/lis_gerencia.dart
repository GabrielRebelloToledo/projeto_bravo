import 'package:bravo/exceptions/http_exception.dart';
import 'package:bravo/models/pessoa.dart';


import 'package:bravo/provider/gerencia.dart';
import 'package:bravo/provider/pessoas.dart';
import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListGerencia extends StatefulWidget {
  final Pessoa pessoa;
  const ListGerencia({Key? key, required this.pessoa}) : super(key: key);

  @override
  _ListGerenciaState createState() => _ListGerenciaState();
}

class _ListGerenciaState extends State<ListGerencia> {
  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);

    return 
         SingleChildScrollView(
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
                              widget.pessoa.datas,
                          style: TextStyle(fontSize: 16),
                        ),
                        isThreeLine: true,
                        trailing: Container(
                          padding: EdgeInsets.only(left: 3),
                          width: 130,
                          child: Row(
                            children: [
                             
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.green,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.cadastroP,
                                    arguments: widget.pessoa,
                                  );
                                },
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
                                  ).then(
                                    (value) async {
                                      if (value ?? false) {
                                        try {
                                          await Provider.of<GerenciaList>(
                                            context,
                                            listen: false,
                                          ).removeProduct(widget.pessoa);
                                        } on HttpException catch (error) {
                                          msg.showSnackBar(
                                            SnackBar(
                                              content: Text(error.toString()),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                  );
                                },
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        
  }
}
