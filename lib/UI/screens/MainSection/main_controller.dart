import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/controller_id.dart';
import 'package:luvit/UI/screens/HomeSection/home_screen.dart';

class MainController extends GetxController{
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  List<Widget> screenDataList = [
    const CommonWrapper(child: HomeScreen()),
    CommonWrapper(child: Container()),
    CommonWrapper(child: Container()),
    CommonWrapper(child: Container()),
    CommonWrapper(child: Container()),
  ];


  animateToPage(int page, {withAnimation = false}) {
    selectedIndex.value = page;
    update([ControllerId.mainScreenKey]);
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: withAnimation ? 250 : 1),
      curve: Curves.easeIn,
    );
  }
}

class CommonWrapper extends StatefulWidget {
  const CommonWrapper({super.key, required this.child});

  final Widget child;

  @override
  State<CommonWrapper> createState() => _CommonWrapperState();
}

class _CommonWrapperState extends State<CommonWrapper> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}