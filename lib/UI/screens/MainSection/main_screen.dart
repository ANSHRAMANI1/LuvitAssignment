import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/Infrastructure/common/controller_id.dart';
import 'package:luvit/Infrastructure/common/image_constant.dart';
import 'package:luvit/UI/screens/MainSection/main_controller.dart';
import 'package:luvit/UI/screens/MainSection/widgets/bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      id: ControllerId.mainScreenKey,
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConstant.background,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                    color: ColorConstant.black,
                    border: Border(top: BorderSide(color: ColorConstant.bottomShadowColor)),
                    shape: BoxShape.circle
                ),
                child: SvgPicture.asset(
                  ImageConstant.reward,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomNavigationBarWidget(
                active: controller.selectedIndex.value,
                homeTap: () {
                  controller.animateToPage(0);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                mapTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                rewardTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                messageTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                profileTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: controller.screenDataList,
          ),
        );
      },
    );
  }
}
