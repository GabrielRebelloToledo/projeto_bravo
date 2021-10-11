import 'package:bravo/core/models/bravo_user.dart';
import 'package:bravo/core/models/chat_message.dart';
import 'package:bravo/core/services/chat/chat_mock_service.dart';

abstract class ChatService {

  Stream<List<ChatMessage>> messagesStream();

  Future<ChatMessage>save(String text, BravoUser user);

factory ChatService(){

  return ChatMockService();
}
}