

import 'package:get/get.dart';
import 'package:graduation_project/view/screens/all_main_screen/create_orders_screen.dart';
import 'package:graduation_project/view/screens/all_main_screen/home_screen.dart';
import 'package:graduation_project/view/screens/all_main_screen/order_screen.dart';
import 'package:graduation_project/view/screens/all_main_screen/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs =  [
      HomeScreen(),
    CreateOrdersScreen(),
     OrderScreen(),
    const SettingsScreen(),
  ];

  var title = [
    "Shtably",
    "Create Order",
    'Orders',
    "Settings",
  ];
}
