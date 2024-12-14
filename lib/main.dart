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
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Poppins",
        useMaterial3: true,
      ),
      home: const HomeLayout(),
    );
  }
}
