import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/Infrastructure/common/image_constant.dart';
import 'package:luvit/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      child: Row(
        children: [
          SvgPicture.asset(
            ImageConstant.homeLocationIcon,
          ),
          const SizedBox(width: 2),
          Expanded(
            child: HeadlineBodyOneBaseWidget(
              title: "목이길어슬픈기린님의 새로운 스팟",
              titleColor: ColorConstant.white,
              fontSize: 14,
              maxLine: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstant.border),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                SvgPicture.asset(ImageConstant.selectedStar),
                const SizedBox(width: 4),
                HeadlineBodyOneBaseWidget(
                  title: "323,233",
                  titleColor: ColorConstant.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
          ),
          const SizedBox(width: 6),
          SizedBox(
            height: 24,
            width: 24,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  ImageConstant.notification,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                      color: ColorConstant.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
