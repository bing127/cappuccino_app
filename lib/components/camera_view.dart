import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cappuccino/service/service.dart';

class CameraView extends StatefulWidget {
  final Function(CameraController) callback;
  const CameraView({super.key, required this.callback});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController controller = CameraController(Service.cameras[0], ResolutionPreset.max);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if(Service.cameras.isNotEmpty) {
        controller.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
          widget.callback(controller);
        }).catchError((Object e) {
          if (e is CameraException) {
            switch (e.code) {
              case 'CameraAccessDenied':
              // Handle access errors here.
                break;
              default:
              // Handle other errors here.
                break;
            }
          }
        });
      }
    });

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    if (controller.cameraId <= 0 && controller.value == null && Service.cameras.isEmpty && !controller.value.isInitialized) {
      return const Text("摄像头未开启");
    }
    return  CameraPreview(controller);
  }
}

