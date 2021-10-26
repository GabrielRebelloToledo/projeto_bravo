import 'package:bravo/routes/routes.dart';
import 'package:flutter/material.dart';

class FormOrHome extends StatelessWidget {
  const FormOrHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuário'),
        centerTitle: true,
      ),
      body: Column(
        /* crossAxisAlignment: CrossAxisAlignment.center, */
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Expanded(
                 child: const Text(
                    'Olá, tudo bem? Para contibuar selecione uma das opções abaixo'),
               ),
            
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed(Routes.cadastro);
              }, child: const Text('Entregador'))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Remetente'))
            ],
          ),
        ],
      ),
    );
  }
}
