import 'package:camera/camera.dart';
import 'package:get/get.dart';

class OCRCameraController extends GetxController {
  Rx<XFile?> capturedImage = Rx<XFile?>(null);
  late CameraController cameraController;
  RxBool isCameraInitialized = false.obs;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    await cameraController.initialize();
    isCameraInitialized.value = true;
  }

  Future<void> captureImage() async {
    if (cameraController.value.isInitialized) {
      final image = await cameraController.takePicture();
      capturedImage.value = image;
    }
  }

  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}
