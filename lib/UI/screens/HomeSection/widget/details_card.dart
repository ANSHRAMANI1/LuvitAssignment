import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/color_constant.dart';
import 'package:luvit/Infrastructure/common/image_constant.dart';
import 'package:luvit/Infrastructure/model/response/data_model.dart';
import 'package:luvit/UI/commons/text_widgets/base/headline_body_one_base_widget.dart';
import 'package:luvit/UI/screens/HomeSection/home_controller.dart';

class DetailsCard extends StatefulWidget {
  const DetailsCard({
    super.key,
    required this.data,
    required this.index,
    required this.onDeleteDrag,
  });

  final DetailsDataModel data;
  final int index;
  final GestureTapCallback onDeleteDrag;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {

  late final ValueNotifier<int> _selectedImageIndex;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    _selectedImageIndex = ValueNotifier(0);
    setTimer();
  }

  setTimer(){
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (time) {
        if (_selectedImageIndex.value < (widget.data.images!.length - 1)) {
          _selectedImageIndex.value += 1;
        }else{
          timer?.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: 'card',
      onDragEnd: (details) {
        if(details.offset.dx < (-30.0)){
          widget.onDeleteDrag();
        }
      },
      maxSimultaneousDrags: widget.index == Get.find<HomeController>().selectedIndex.value ? 1 : 0,
      feedback: buildWidget(),
      childWhenDragging: Container(
        height: MediaQuery.sizeOf(context).height * .55,
      ),
      child: buildWidget(),
    );
  }

  Widget buildWidget(){
    return Material(
      color: Colors.transparent,
      child: ValueListenableBuilder(
        valueListenable: _selectedImageIndex,
        builder: (context, value, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: MediaQuery.sizeOf(context).width * .875,
            height: MediaQuery.sizeOf(context).height * .7,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: ColorConstant.border),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(widget.data.images![value]),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  Exception("Image Error :- $exception");
                },
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.black.withOpacity(.4),
                              Colors.black.withOpacity(1),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: List.generate(
                          widget.data.images!.length,
                              (i) => Expanded(
                            child: _selectedImageIndex.value == i
                                ? Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                              child: TweenAnimationBuilder<double>(
                                duration: const Duration(seconds: 5),
                                curve: Curves.easeInOut,
                                tween: Tween<double>(
                                  begin: 0,
                                  end: 1,
                                ),
                                builder: (context, value, _) =>
                                    LinearProgressIndicator(
                                      value: value,
                                      borderRadius: BorderRadius.circular(100),
                                      minHeight: 3,
                                      valueColor: AlwaysStoppedAnimation(ColorConstant.pink),
                                      backgroundColor: ColorConstant.black20,
                                    ),
                              ),
                            )
                                : Container(
                              height: 3,
                              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                              decoration: BoxDecoration(
                                color: _selectedImageIndex.value >= i
                                    ? ColorConstant.pink
                                    : ColorConstant.black20,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                      ).paddingSymmetric(horizontal: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_selectedImageIndex.value != 0) {
                                          _selectedImageIndex.value -= 1;
                                          timer?.cancel();
                                          setTimer();
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_selectedImageIndex.value < (widget.data.images!.length - 1)) {
                                          _selectedImageIndex.value += 1;
                                          timer?.cancel();
                                          setTimer();
                                        }else{
                                          timer?.cancel();
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.black,
                                        border: Border.all(color: ColorConstant.border),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(ImageConstant.unselectedStar),
                                          const SizedBox(width: 4),
                                          HeadlineBodyOneBaseWidget(
                                            title: "${widget.data.likeCount ?? 0}",
                                            titleColor: ColorConstant.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: RichText(
                                              text: TextSpan(
                                                text: widget.data.name,
                                                style: TextStyle(
                                                  fontSize: 28,
                                                  color: ColorConstant.whiteFC,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: " ${widget.data.age}",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: ColorConstant.whiteFC,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                          if(_selectedImageIndex.value == 0)
                                          FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: HeadlineBodyOneBaseWidget(
                                              title: widget.data.location,
                                              fontSize: 15,
                                              titleColor: ColorConstant.whiteD9,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          if(_selectedImageIndex.value == 1)
                                          HeadlineBodyOneBaseWidget(
                                            title: widget.data.description,
                                            fontSize: 15,
                                            titleColor: ColorConstant.whiteD9,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          const SizedBox(height: 4),
                                          if(_selectedImageIndex.value >= 2)
                                          Wrap(
                                            spacing: 4,
                                            runSpacing: 4,
                                            children: List.generate(widget.data.tags?.length ?? 0, (i) => FittedBox(
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                                                decoration: BoxDecoration(
                                                  color:  i ==0 ? ColorConstant.pink621 :ColorConstant.black1A,
                                                  border: Border.all(color: i == 0 ? ColorConstant.pink :ColorConstant.grey3A),
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: HeadlineBodyOneBaseWidget(
                                                  title: widget.data.tags?[i] ?? "",
                                                  titleColor: ColorConstant.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    SvgPicture.asset(ImageConstant.likeBtn),
                                  ],
                                ),
                                Center(
                                  child: SvgPicture.asset(ImageConstant.arrowDown).paddingSymmetric(vertical: 20),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
