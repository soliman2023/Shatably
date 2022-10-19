
import 'package:get/route_manager.dart';
import 'package:graduation_project/units/constants.dart';
import 'ar.dart';
import 'en.dart';


class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
      };
}
