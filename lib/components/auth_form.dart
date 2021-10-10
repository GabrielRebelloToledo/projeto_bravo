import 'package:bravo/components/user_image_picker.dart';
import 'package:bravo/core/models/auth_form_data.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //acesso aos dados do formulario atravez do globalkey
  final _formKey = GlobalKey<FormState>();
  //classe que irá guardar os dados do formulário
  final _AuthFormData = AuthFormData();

  void _handleImagemPick(File image) {
    _AuthFormData.image = image;
  }
void _showError(String msg){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar
    (
      content: Text(msg),
      backgroundColor: Theme.of(context).errorColor,
  )
);
}

  //metodo para submeter o formulario
  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if(_AuthFormData.image == null && _AuthFormData.isSinup){
      return _showError('Imagem não selecionada!');
    }

    widget.onSubmit(_AuthFormData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_AuthFormData.isSinup)
                  UserImagePicker(
                    onImagePick: _handleImagemPick,
                  ),
                if (_AuthFormData.isSinup)
                  TextFormField(
                    key: ValueKey('nome'),
                    initialValue: _AuthFormData.name,
                    onChanged: (name) => _AuthFormData.name = name,
                    decoration: InputDecoration(label: Text('Nome')),
                    validator: (_name) {
                      final name = _name ?? '';
                      if (name.trim().length < 5) {
                        return 'Nome precisa conter no mínimo 5 caracteres';
                      }
                      return null;
                    },
                  ),
                TextFormField(
                  key: ValueKey('email'),
                  initialValue: _AuthFormData.email,
                  onChanged: (email) => _AuthFormData.email = email,
                  decoration: InputDecoration(label: Text('E-mail')),
                  validator: (_email) {
                    final email = _email ?? '';
                    if (!email.contains('@')) {
                      return 'E-mail informado não é valido.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: ValueKey('password'),
                  initialValue: _AuthFormData.password,
                  onChanged: (password) => _AuthFormData.password = password,
                  obscureText: true,
                  decoration: InputDecoration(label: Text('Senha')),
                  validator: (_password) {
                    final password = _password ?? '';
                    if (password.length < 6) {
                      return 'Senha deve conter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: _submit,
                    child:
                        Text(_AuthFormData.isLogin ? 'Entrar' : 'Cadastrar')),
                TextButton(
                    onPressed: () {
                      setState(() {
                        _AuthFormData.toggleAuthMode();
                      });
                    },
                    child: Text(_AuthFormData.isLogin
                        ? 'Criar uma nova conta ?'
                        : 'já possui conta ?')),
              ],
            )),
      ),
    );
  }
}
