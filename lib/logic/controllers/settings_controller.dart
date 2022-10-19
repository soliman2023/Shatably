
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/units/constants.dart';


class SettingController extends GetxController {
  var switchValue = false;
  var storage = GetStorage();
  var langLocal = ara;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language

  @override
  void onInit() async {

    langLocal = await getLanguage;
    super.onInit();
  }
  void switchTheme(bool theme){
    switchValue=theme;
    update();
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

   get getLanguage async {
    return await storage.read("lang")??langLocal;
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
