import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

class ChatBotController extends GetxController {
  var messages = <types.Message>[].obs;
  var isTyping = false.obs;

  void addMessage(message) => messages.insert(0, message);

  void setIsTyping(typing) => typing = typing;
}
