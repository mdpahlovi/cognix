import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cognix/controllers/chat_bot.dart';
import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ChatBot extends StatelessWidget {
  ChatBot({super.key});

  final ChatBotController controller = Get.put(ChatBotController());

  final openai = OpenAI.instance.build(
    token: "",
    baseOption: HttpSetup(connectTimeout: const Duration(seconds: 10)),
    enableLog: true,
  );

  final curUser = const types.User(id: 'ET4079', firstName: "MD Pahlovi");
  final gptUser = const types.User(id: 'RE1863', firstName: "Bot");

  Future<void> handleSendPressed(types.PartialText message, List<types.Message> messages) async {
    final textMessage = types.TextMessage(
      author: curUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    controller.addMessage(textMessage);

    List<Map<String, dynamic>> histories = [...messages, textMessage].map((m) {
      if (m.author.id == curUser.id) {
        return Messages(role: Role.user, content: (m as types.TextMessage).text).toJson();
      } else {
        return Messages(role: Role.assistant, content: (m as types.TextMessage).text).toJson();
      }
    }).toList();

    final request = ChatCompleteText(
      messages: histories,
      maxToken: 200,
      model: GptTurbo0301ChatModel(),
    );

    try {
      final response = await openai.onChatCompletion(request: request);

      for (var element in response!.choices) {
        if (element.message != null) {
          controller.addMessage(types.TextMessage(
            author: gptUser,
            createdAt: DateTime.now().millisecondsSinceEpoch,
            id: const Uuid().v4(),
            text: element.message!.content,
          ));
        }
      }
    } catch (e) {
      controller.addMessage(types.TextMessage(
        author: gptUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: "I'm currently unable to respond. Please try again later.",
      ));
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
          user: curUser,
        ),
      ),
    );
  }
}
