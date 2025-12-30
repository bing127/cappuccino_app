import 'package:get/get.dart';
import 'package:scan/scan.dart';

class ScanState {
  late Rx<ScanController> scanKitController = ScanController().obs;
  final RxBool isFlash = false.obs;
  ScanState() {
    ///Initialize variables
  }
}
