import 'package:flutter/material.dart';
import 'package:kajbari/layouts/home.dart';

void main() {
  runApp(const KajBari());
}

class KajBari extends StatelessWidget {
  const KajBari({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KajBari',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xFF010101),
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
      home: const HomeLayout(),
    );
  }
}
