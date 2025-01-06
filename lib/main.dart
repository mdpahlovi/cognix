import 'package:cognix/layouts/home.dart';
import 'package:cognix/screens/features/chat_bot.dart';
import 'package:cognix/screens/features/image_generator.dart';
import 'package:cognix/screens/features/voice_assistant.dart';
import 'package:cognix/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Cognix());
}

class Cognix extends StatelessWidget {
  const Cognix({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cognix',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xFF010101),
          surfaceTintColor: const Color(0xFF171717),
        ),
        scaffoldBackgroundColor: const Color(0xFF010101),
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: const Color(0xFFC6F432),
          onPrimary: const Color(0xFF000000),
          secondary: const Color(0xFFC09FF8),
          onSecondary: const Color(0xFF000000),
          tertiary: const Color(0xFFFEC4DD),
          onTertiary: const Color(0xFF000000),
          surface: const Color(0xFF171717),
          onSurface: const Color(0xFFFFFFFF),
          error: const Color(0xFFFF0000),
          onError: const Color(0xFFFFFFFF),
          outline: const Color(0x1AFFFFFF),
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeLayout(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: '/chat-bot',
          page: () => ChatBot(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/image-generator',
          page: () => ImageGenerator(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/voice-assistant',
          page: () => VoiceAssistant(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
