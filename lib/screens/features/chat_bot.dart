import 'package:cognix/controllers/chat_bot.dart';
import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:uuid/uuid.dart';

class ChatBot extends StatelessWidget {
  ChatBot({super.key});

  final ChatBotController controller = Get.put(ChatBotController());

  final curUser = const types.User(id: 'ET4079', firstName: "MD Pahlovi");
  final botUser = const types.User(id: 'RE1863', firstName: "Bot");

  final String apiKey = dotenv.env['GEMINI_API_KEY']!;

  Future<void> handleSendPressed(types.PartialText message, List<types.Message> messages) async {
    final textMessage = types.TextMessage(
      author: curUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    controller.addMessage(textMessage);
    controller.setIsTyping(true);

    try {
      Iterable<Content> histories = [...messages, textMessage]
          .where((m) => m.author.id == curUser.id)
          .map((m) => Content.text((m as types.TextMessage).text))
          .toList();

      final geminiAPI = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);
      final responses = await geminiAPI.generateContent(histories);

      if (responses.text is String) {
        controller.addMessage(types.TextMessage(
          author: botUser,
          createdAt: DateTime.now().millisecondsSinceEpoch,
          id: const Uuid().v4(),
          text: responses.text!.trim(),
        ));
      }
    } catch (e) {
      controller.addMessage(types.TextMessage(
        author: botUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "I'm currently unable to respond. Please try again later.",
      ));
    } finally {
      controller.setIsTyping(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), title: Text("Chat Bot")),
      body: Obx(
        () => Chat(
          dateHeaderBuilder: (date) => SizedBox.shrink(),
          emptyState: Center(child: Text("How can I help you?")),
          theme: DarkChatTheme(
            backgroundColor: Color(0xFF010101),
            inputBackgroundColor: theme.surface,
            inputTextCursorColor: theme.primary,
            primaryColor: theme.primary,
            secondaryColor: theme.secondary,
            messageInsetsHorizontal: 10,
            messageInsetsVertical: 6,
            messageBorderRadius: 10,
            inputTextStyle: TextStyle(color: theme.onSurface),
            sentMessageBodyTextStyle: TextStyle(color: theme.onPrimary),
            receivedMessageBodyTextStyle: TextStyle(color: theme.onPrimary),
          ),
          messages: controller.messages.toList(),
          onSendPressed: (message) => handleSendPressed(message, controller.messages.toList()),
          typingIndicatorOptions: TypingIndicatorOptions(typingUsers: controller.isTyping.value == true ? [botUser] : []),
          user: curUser,
        ),
      ),
    );
  }
}
