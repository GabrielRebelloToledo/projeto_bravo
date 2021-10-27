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
  bool analise = false;
  bool termos = true;


  @override
  Widget build(BuildContext context) {
    final msg = ScaffoldMessenger.of(context);
  
  

  return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    analise
                        ? Text('Olá ' +
                            widget.users.name.trimRight() +
                            ',seu perfil ainda se encontra em análise, aguarde!')
                        : Text('Olá ' +
                            widget.users.name.trimRight() +
                            ',seu perfil está autorizado'),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.name,
                              decoration: InputDecoration(
                                labelText: 'Nome completo',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.sex,
                              decoration: InputDecoration(
                                labelText: 'Sexo:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.birthDay,
                              decoration: InputDecoration(
                                labelText: 'Data de Aniversário:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.naturalidade,
                              decoration: InputDecoration(
                                labelText: 'Naturalidade:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.escolaridade,
                              decoration: InputDecoration(
                                labelText: 'Escolaridade',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.nameMother,
                              decoration: InputDecoration(
                                labelText: 'Nome completo da Mãe:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.nameFather,
                              decoration: InputDecoration(
                                labelText: 'Nome completo do Pai:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.cep,
                              decoration: InputDecoration(
                                labelText: 'CEP:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.endereco,
                              decoration: InputDecoration(
                                labelText: 'Endereço:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.complemento,
                              decoration: InputDecoration(
                                labelText: 'Complemento:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.bairro,
                              decoration: InputDecoration(
                                labelText: 'Bairro:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.cidade,
                              decoration: InputDecoration(
                                labelText: 'Cidade:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.unidadefederativa,
                              decoration: InputDecoration(
                                labelText: 'Unidade Federativa:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.cpf,
                              decoration: InputDecoration(
                                labelText: 'CPF:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.identidade,
                              decoration: InputDecoration(
                                labelText: 'Identidade:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.emissor,
                              decoration: InputDecoration(
                                labelText: 'Emissor:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.dateEmissao,
                              decoration: InputDecoration(
                                labelText: 'Data da Emissão:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.ddd,
                              decoration: InputDecoration(
                                labelText: 'DDD:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.numbertelephone,
                              decoration: InputDecoration(
                                labelText: 'Numero de telefone:',
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              initialValue: widget.users.email,
                              decoration: InputDecoration(
                                labelText: 'E-mail: ',
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Selecione o Decúbito Inicial do Paciente:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                               
                                
                              ],
                            )
                          ],
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
/*  Padding(
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
              ), */
