import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cognix/controllers/ocr_controller.dart';
import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class OCRTool extends StatelessWidget {
  OCRTool({super.key});

  final OCRController ocrController = Get.put(OCRController());

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(leading: CustomBackButton(), title: Text("OCR (Text Recognition)")),
      body: Obx(
        () {
          final images = ocrController.images;
          final imageCount = images.length;

          if (imageCount > 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageCount + 1,
                      itemBuilder: (context, index) {
                        return index != imageCount
                            ? buildImageTile(image: images[index], select: true, onSelect: () => {})
                            : buildAddImageTile();
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: theme.primary),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primary,
                      foregroundColor: theme.onPrimary,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Extract Text"),
                  )
                ],
              ),
            );
          } else {
            return Center(
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
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/camera"),
        child: Icon(HugeIcons.strokeRoundedCamera01),
      ),
    );
  }
}

Widget buildImageTile({required XFile image, required bool select, required void onSelect}) {
  return select
      ? Stack(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFC6F432)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(File(image.path), fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFC6F432),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(HugeIcons.strokeRoundedTick01, color: Colors.black, size: 16),
              ),
            ),
          ],
        )
      : AspectRatio(
          aspectRatio: 3 / 4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(File(image.path), fit: BoxFit.cover),
          ),
        );
}

Widget buildAddImageTile() {
  return GestureDetector(
    onTap: () => {},
    child: AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFC6F432),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(HugeIcons.strokeRoundedAdd01, size: 48, color: Colors.black),
            SizedBox(height: 10),
            Text("Add Image", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    ),
  );
}
