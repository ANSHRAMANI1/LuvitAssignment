import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/Infrastructure/common/controller_id.dart';
import 'package:luvit/UI/screens/HomeSection/home_controller.dart';
import 'package:luvit/UI/screens/HomeSection/widget/details_card.dart';
import 'package:luvit/UI/screens/HomeSection/widget/home_appbar.dart';
import 'package:luvit/UI/screens/HomeSection/widget/no_data_available_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: ControllerId.homeScreenKey,
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorConstant.background,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: ColorConstant.background,
          ),
          body: Column(
            children: [
              ///appbar
              const HomeAppBar(),

              ///body
              const SizedBox(height: 20),

              Expanded(
                child: controller.userDataList.isEmpty
                    ? const NoDataAvailableWidget()
                    : PageView.builder(
                        controller: controller.pageController,
                        itemCount: controller.userDataList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (value) {
                          controller.selectedIndex.value = value;
                          controller.update([ControllerId.homeScreenKey]);
                        },
                        itemBuilder: (context, index) {
                          return DetailsCard(
                            data: controller.userDataList[index],
                            index: index,
                            onDeleteDrag: controller.deleteData,
                          );
                        },
                      ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
