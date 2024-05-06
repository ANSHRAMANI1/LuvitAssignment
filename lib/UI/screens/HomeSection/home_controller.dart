import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luvit/Infrastructure/common/app_constant.dart';
import 'package:luvit/Infrastructure/common/controller_id.dart';
import 'package:luvit/Infrastructure/model/response/data_model.dart';

class HomeController extends GetxController{

  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController(viewportFraction: .9);

  RxList<DetailsDataModel> userDataList = <DetailsDataModel>[].obs;

  getData(){
    userDataList.value = dataModelFromJson(jsonEncode(AppConstants.data));
    update([ControllerId.homeScreenKey]);
  }

  deleteData(){
    userDataList.removeAt(selectedIndex.value);
    update([ControllerId.homeScreenKey]);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }

}