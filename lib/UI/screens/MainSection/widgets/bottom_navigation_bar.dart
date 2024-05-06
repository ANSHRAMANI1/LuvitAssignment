import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/Infrastructure/common/image_constant.dart';
import 'package:luvit/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.active,
    required this.homeTap,
    required this.mapTap,
    required this.rewardTap,
    required this.messageTap,
    required this.profileTap,
  });

  final GestureTapCallback homeTap;
  final GestureTapCallback mapTap;
  final GestureTapCallback rewardTap;
  final GestureTapCallback messageTap;
  final GestureTapCallback profileTap;
  final int active;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: width,
        padding: const EdgeInsets.only(bottom: 20, top: 4),
        decoration: BoxDecoration(
          color: ColorConstant.black,
          borderRadius:
          const BorderRadius.vertical(top: Radius.circular(12)),
          border: Border(
              top: BorderSide(color: ColorConstant.bottomShadowColor)),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.bottomShadowColor,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconWidget(
              context: context,
              width: width,
              onTap: homeTap,
              title: "홈",
              icon: ImageConstant.home,
              selected: 0,
            ),
            iconWidget(
              context: context,
              width: width,
              onTap: mapTap,
              title: "스팟",
              icon: ImageConstant.location,
              selected: 1,
            ),
            InkWell(
              onTap: rewardTap,
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: width / 5,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: ColorConstant.bottomShadowColor)),
                      shape: BoxShape.circle),
                  child: SvgPicture.asset(
                    ImageConstant.reward,
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            iconWidget(
              context: context,
              width: width,
              onTap: messageTap,
              title: "채팅",
              icon: ImageConstant.messages,
              selected: 3,
            ),
            iconWidget(
              context: context,
              width: width,
              onTap: profileTap,
              title: "마이",
              icon: ImageConstant.profile,
              selected: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget iconWidget({
    required BuildContext context,
    required double width,
    required GestureTapCallback onTap,
    required String title,
    required String icon,
    required int selected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: width / 5,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
              ),
              HeadlineBodyOneBaseWidget(
                title: title,
                titleColor: active == selected
                    ? ColorConstant.pink
                    : ColorConstant.grey3A,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
