import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cognix/controllers/ocr_controller.dart';
import 'package:cognix/widgets/global/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController controller;

  final OCRController ocrController = Get.put(OCRController());

  bool isFirstCamera = true;
  bool isCameraInitialized = false;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    controller = CameraController(isFirstCamera ? cameras.first : cameras.last, ResolutionPreset.high);

    await controller.initialize();
    setState(() => isCameraInitialized = true);
  }

  void toggleFlash() {
    controller.setFlashMode(isFlashOn ? FlashMode.off : FlashMode.torch);
    setState(() => isFlashOn = !isFlashOn);
  }

  void switchCamera() {
    setState(() => isFirstCamera = !isFirstCamera);
    initializeCamera();
  }

  Future<void> captureImage() async {
    if (controller.value.isInitialized) {
      final image = await controller.takePicture();
      ocrController.setImage(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get MediaQuery data
    final mediaQuery = MediaQuery.of(context);

    // Calculate safe width and height
    final safeW = mediaQuery.size.width;
    final safeH = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom;

    return SafeArea(
      child: isCameraInitialized
          ? Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: safeW / safeH,
                    child: CameraPreview(controller),
                  ),
                ),

                // Top Buttons
                Positioned(
                  top: 4,
                  left: 4,
                  right: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(),
                      IconButton.outlined(
                        onPressed: toggleFlash,
                        icon: Icon(isFlashOn ? HugeIcons.strokeRoundedFlash : HugeIcons.strokeRoundedFlashOff, size: 20),
                      ),
                    ],
                  ),
                ),

                // Bottom Buttons
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () {
                          final images = ocrController.images;
                          final imageCount = images.length;

                          if (imageCount > 0) {
                            final lastImage = images.last;
                            return Badge(
                              label: Text(imageCount.toString()),
                              child: GestureDetector(
                                onTap: () => Get.toNamed("/ocr-tool"),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(File(lastImage.path), width: 64, height: 64, fit: BoxFit.cover),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(width: 64, height: 64);
                          }
                        },
                      ),
                      IconButton.filled(
                        onPressed: captureImage,
                        icon: Icon(HugeIcons.strokeRoundedCameraLens, size: 32),
                        padding: EdgeInsets.all(16),
                      ),
                      IconButton.outlined(
                        onPressed: switchCamera,
                        icon: Icon(HugeIcons.strokeRoundedExchange01, size: 20),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
