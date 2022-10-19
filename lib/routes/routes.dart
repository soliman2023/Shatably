import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/logic/bindings/auth_biniding.dart';
import 'package:graduation_project/logic/bindings/main_binding.dart';
import 'package:graduation_project/logic/bindings/product_binding.dart';
import 'package:graduation_project/view/screens/auth/login.dart';
import 'package:graduation_project/view/screens/auth/signup.dart';
import 'package:graduation_project/view/screens/cart_screen.dart';
import 'package:graduation_project/view/screens/drawer/electronic_engineer/home_engineer.dart';
import 'package:graduation_project/view/screens/drawer/favorites_screen.dart';
import 'package:graduation_project/view/screens/drawer/profile-screen.dart';
import 'package:graduation_project/view/screens/intro/IntroScreen.dart';
import 'package:graduation_project/view/screens/intro/SplashScreen.dart';
import 'package:graduation_project/view/screens/main_screen.dart';
import 'package:graduation_project/view/screens/payment_screen.dart';
import 'package:graduation_project/view/screens/setting/chat-bot.dart';
import 'package:graduation_project/view/screens/setting/chat-screen.dart';
import 'package:graduation_project/view/screens/setting/credit-card.dart';
import 'package:graduation_project/view/screens/setting/ml-credit-card.dart';


class RouteApp{
  static  String stateUser=GetStorage().read<bool>("auth")??false||FirebaseAuth.instance.currentUser!=null?Routes.mainScreen:Routes.login;
  static  String firstScreen=Routes.splashScreen;
  static final getPage=[
    GetPage(
        name: Routes.login,
        page: ()=>  LoginScreen(),
    binding: AuthBinding()),
    GetPage(
        name: Routes.signup,
        page: ()=> ClientSignUpScreen()),
    GetPage(
        name: Routes.cardScreen,
        page: ()=>  CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],),

    GetPage(
        name: Routes.mainScreen,
        page: ()=>  MainScreen(),
      bindings: [
        AuthBinding(),
        MainBininding(),
        ProductBinding(),
      ],),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBininding(),
      ],
    ),
    GetPage(name: Routes.favoritesScreen, page: ()=>FavoritesScreen()),
    GetPage(name: Routes.onBoardingPage, page: ()=>OnBoardingPage()),
    GetPage(name: Routes.splashScreen, page: ()=>  SplashScreen()),
    GetPage(name: Routes.electronicEngineer, page: ()=>HomeEngineer()),
    GetPage(name: Routes.profileScreen, page: ()=>ProfileScreen(),
    bindings: [
      AuthBinding(),
      MainBininding(),
    ]
    ),
    GetPage(name: Routes.chatScreen, page: ()=>ChatScreen()),
    GetPage(name: Routes.chatBotScreen, page: ()=>Chat()),
    GetPage(name: Routes.creditCardScreen, page: ()=>CreditCardPage()),
    GetPage(name: Routes.mlCreditCardScreen, page: ()=>MlCreditCard()),
  ];


}
class Routes{
  static const String splashScreen='/splashScreen';
  static const String onBoardingPage='/onBoardingPage';
  static const String login='/loginScreen';
  static const String signup='/signupScreen';
  static const String cardScreen='/cardScreen';
  static const String favoritesScreen='/favoritesScreen';
  static const String mainScreen='/mainScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String moreDetailOrder = '/moreDetailOrder';
  static const String electronicEngineer = '/electronicEngineer';
  static const String profileScreen = '/profileScreen';
  static const String chatScreen = '/ChatScreen';
  static const String chatBotScreen = '/ChatBotScreen';
  static const String creditCardScreen = '/creditCardScreen';
  static const String mlCreditCardScreen = '/mlCreditCardScreen';
}