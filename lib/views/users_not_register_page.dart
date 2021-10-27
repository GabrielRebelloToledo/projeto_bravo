import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';

class UsersNotRegister extends StatelessWidget {
  const UsersNotRegister({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 40),
                        child: Text(
                          'Nenhum Usuário Encontrado',
                          style: TextStyle(fontSize: 30, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.cyanAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Clique no Botão abaixo para se Cadastrar', style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                Routes.cadastro
                                );
                          },
                          child: Text('Cadastrar'),
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}