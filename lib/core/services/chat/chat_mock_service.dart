import 'dart:async';
import 'dart:math';
import 'package:bravo/core/models/bravo_user.dart';
import 'package:bravo/core/models/chat_message.dart';
import 'package:bravo/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Oi, bom dia',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Gabriel',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Oi, bom dia Gabriel',
      createdAt: DateTime.now(),
      userId: '1234',
      userName: 'Joana',
      userImageUrl: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'Fala ai Gabriel',
      createdAt: DateTime.now(),
      userId: '12345',
      userName: 'João',
      userImageUrl: 'assets/images/avatar.png',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    _controller?.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, BravoUser user) async {
    final newMenssage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageUrl: user.imageURL,
    );

    _msgs.add(newMenssage);
    _controller?.add(_msgs);
    return newMenssage;
  }
}
