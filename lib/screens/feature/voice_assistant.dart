import 'dart:async';
import 'dart:io' show Platform;

import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

@pragma('vm:entry-point')
void backgroundNotificationListener(Map<String, dynamic> data) {
  String notificationTitle = 'Dummy Notification';
  String notificationTexts = data['message'] ?? 'Hello, 😂 This is dummy Notification!';

  Pushy.notify(notificationTitle, notificationTexts, data);
  Pushy.clearBadge();
}

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({super.key});

  @override
  VoiceAssistantState createState() => VoiceAssistantState();
}

class VoiceAssistantState extends State<VoiceAssistant> {
  String deviceToken = 'Loading...';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Pushy.listen();
    Pushy.setAppId('67855314fd40a4ea7333863f');
    Pushy.toggleFCM(true);

    try {
      String token = await Pushy.register();
      setState(() => deviceToken = token);
    } catch (error) {
      setState(() => deviceToken = 'Registration failed');
    }

    Pushy.toggleInAppBanner(true);
    Pushy.setNotificationListener(backgroundNotificationListener);
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
      String message = data['message'] ?? 'Hello, 😂 This is dummy Notification!';

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text('Notification clicked'), content: Text(message), actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            )
          ]);
        },
      );

      Pushy.clearBadge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), title: const Text('Voice Assistant')),
      body: Builder(
        builder: (context) => Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
          Image.asset('assets/robot.png', width: 90),
          SizedBox(height: 20),
          SelectableText(deviceToken, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ])),
      ),
    );
  }
}

bool isAndroid() {
  try {
    return Platform.isAndroid;
  } catch (e) {
    return false;
  }
}
