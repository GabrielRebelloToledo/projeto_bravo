import 'package:bravo/core/services/auth/auth_service.dart';
import 'package:bravo/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _Message = '';
  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      await ChatService().save(_Message, user);
    }
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (msg) => setState(() {
              _Message = msg;
            }),
            decoration: InputDecoration(
              labelText: 'Enviar mensagem',
            ),
            onSubmitted: (_){
              if(_Message.trim().isNotEmpty){
                _sendMessage();
              }
            },
          ),
        ),
        IconButton(
          onPressed: _Message.trim().isEmpty ? null : _sendMessage,
          icon: Icon(Icons.send),
        ),
      ],
    );
  }
}
