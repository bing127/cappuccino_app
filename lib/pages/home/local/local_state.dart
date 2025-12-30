import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class LocalState {
  Rx<RefreshController> refreshController = RefreshController().obs;
  LocalState() {
    ///Initialize variables
  }
}
