
import 'package:get/instance_manager.dart';
import 'package:graduation_project/logic/controllers/cart_controller.dart';
import 'package:graduation_project/logic/controllers/category_controller.dart';
import 'package:graduation_project/logic/controllers/product_controller.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
