import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class OCRTool extends StatelessWidget {
  const OCRTool({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), title: Text("OCR (Text Recognition)")),
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/clipboard.png', width: 192),
              SizedBox(height: 20),
              Text(
                "Don't have any document",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Start a new scan from your camera or\nimported photos",
                textAlign: TextAlign.center,
                style: TextStyle(color: theme.onSurface.withAlpha(128)),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(HugeIcons.strokeRoundedCamera01),
      ),
    );
  }
}
