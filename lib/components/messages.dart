import 'package:bravo/components/message_bubble.dart';
import 'package:bravo/core/models/chat_message.dart';
import 'package:bravo/core/services/auth/auth_service.dart';
import 'package:bravo/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messagesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Sem mensagens. Vamos conversar?'));
          } else {
            final msgs = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemBuilder: (context, indice) => MessageBubble(
                key: ValueKey(msgs[indice].id),
                message: msgs[indice],
                belongsToCurrentUser: currentUser?.id == msgs[indice].userId,
              ),
              itemCount: msgs.length,
            );
          }
        });
  }
}
