import 'package:get/get.dart';
import 'package:luvit/UI/screens/HomeSection/home_controller.dart';
import 'package:luvit/UI/screens/MainSection/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
  }

}