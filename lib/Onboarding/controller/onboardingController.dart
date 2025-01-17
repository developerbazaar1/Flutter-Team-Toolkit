import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/imageModel.dart';


class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  int pages = 3;
  RxDouble progress = 0.25.obs;
  var controller;
  final pageController = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  ).obs;

  List<ImageInfoModel> imageInfoList = [
    ImageInfoModel(
      'assets/svg/MessyDoodle.svg',
      "AppText.onboarding1HeadingText",
      "AppText.onboarding1Content",
    ),
    ImageInfoModel(
      'assets/svg/ReadingSideDoodle.svg',
      "AppText.onboarding2HeadingText",
      "AppText.onboarding2Content",
    ),
    ImageInfoModel(
      'assets/svg/SitReadingDoodle.svg',
    "AppText.onboarding3HeadingText",
      "AppText.onboarding3Content",
    ),
  ];

  @override
  void onInit() {
    controller = PageController(
      viewportFraction: 0.8,
    );
    super.onInit();
    pageController.value.addListener(() {
      handlePageChange(pageController.value.page!.round());
    });
  }

  void handlePageChange(int pageIndex) {
    if (pageIndex == 0) {
      progress.value = 0.25;
    } else if (pageIndex == 1) {
      progress.value = 0.50;
    } else if (pageIndex == 2) {
      progress.value = 0.75;
    } else {
      progress.value = 1.0;
    }

    currentPage.value = pageIndex;
  }
}


