import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/routes_constant.dart';
import 'package:luvit/UI/screens/HomeSection/home_binding.dart';
import 'package:luvit/UI/screens/HomeSection/home_screen.dart';
import 'package:luvit/UI/screens/MainSection/main_binding.dart';
import 'package:luvit/UI/screens/MainSection/main_screen.dart';

class AppPages {

  static final pages = [
    GetPage(
      name: RoutesConstant.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutesConstant.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}