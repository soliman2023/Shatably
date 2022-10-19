
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/constants.dart';
import 'package:graduation_project/units/theme.dart';
import 'language/localiztion.dart';
import 'logic/controllers/theme_controller.dart';
import 'units/theme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    runApp(const MyApp());
  });
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       title: 'Shtably',
       locale: Locale(GetStorage().read<String>('lang').toString()),
       translations: LocaliztionApp(),
       fallbackLocale: Locale(ara),
       theme: ThemesApp.light,
       darkTheme: ThemesApp.dark,
       themeMode: ThemeController().themeDataGet,
       initialRoute: RouteApp.firstScreen,
       getPages: RouteApp.getPage,
       //home: const LoginScreen(),
     );
  }
}

