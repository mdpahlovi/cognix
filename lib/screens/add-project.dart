import 'package:flutter/material.dart';
import 'package:kajbari/widgets/global/BackButton.dart';
import 'package:kajbari/widgets/global/NotificationButton.dart';

class AddProject extends StatelessWidget {
  const AddProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text("Add Project"),
        actions: [NotificationButton(), SizedBox(width: 8)],
      ),
      body: const Center(
        child: Text('Add Project'),
      ),
    );
  }
}
