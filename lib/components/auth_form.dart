import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        child: 
      Column(
        children: [
          TextFormField(
            decoration: InputDecoration(label: Text('Nome')),
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('E-mail')),
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('Senha')),
          ),
        ],
      )
      
      ),
    );
  }
}