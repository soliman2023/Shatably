
import 'package:get/instance_manager.dart';
import 'package:graduation_project/logic/controllers/auth_controller.dart';
import 'package:graduation_project/logic/controllers/main_controller.dart';
import 'package:graduation_project/logic/controllers/order_controller.dart';
import 'package:graduation_project/logic/controllers/settings_controller.dart';


class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(OrderController());
    Get.put(SettingController());
    //Get.put(PayMentController(), permanent: true);
  }
}
