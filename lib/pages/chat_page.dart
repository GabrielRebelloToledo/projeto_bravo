import 'package:bravo/components/messages.dart';
import 'package:bravo/components/new_message.dart';
import 'package:bravo/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bravo Chat'),
          centerTitle: true,
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 10),
                        Text('Sair')
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if(value == 'logout'){
                  AuthService().logout();
                }
              },
            )
          ],
          
        ),
        body: SafeArea(
            child: Column(
          children: [Expanded(child: Messages()), NewMessage()],
        )));
  }
}
