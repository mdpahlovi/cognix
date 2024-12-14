import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(HugeIcons.strokeRoundedArrowLeft01),
          padding: EdgeInsets.only(right: 2),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(theme.surface),
          ),
        ),
        title: Text("Add Project"),
        actions: [
          IconButton.outlined(
            onPressed: () {},
            iconSize: 20,
            icon: Icon(HugeIcons.strokeRoundedNotification02),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(theme.surface),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Add Project'),
      ),
    );
  }
}
