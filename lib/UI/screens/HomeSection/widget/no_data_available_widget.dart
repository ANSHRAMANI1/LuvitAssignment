import 'package:flutter/material.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';

class NoDataAvailableWidget extends StatelessWidget {
  const NoDataAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadlineBodyOneBaseWidget(
            title: "추천 드릴 친구들을 준비 중이에요",
            titleColor: ColorConstant.whiteFC,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          HeadlineBodyOneBaseWidget(
            title: "매일 새로운 친구들을 소개시켜드려요",
            titleColor: ColorConstant.greyAD,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
