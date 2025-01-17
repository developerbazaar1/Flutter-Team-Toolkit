import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:newtest_app/Bottom%20navigation%20bar/controller/bottomNavigationBarController.dart';
import 'package:newtest_app/Onboarding/view/NavigationScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/onboardingController.dart';




class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: height* 0.1),
        margin:
        EdgeInsets.only(left:width * 0.05, right: width * 0.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.73,
              child: Obx(() => PageView.builder(
                pageSnapping: true,
                allowImplicitScrolling: true,
                scrollBehavior: const ScrollBehavior(),
                dragStartBehavior: DragStartBehavior.start,
                controller: controller.pageController.value,
                itemCount: controller.pages,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padEnds: true,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      SizedBox(height: height * 0.02),
                      SvgPicture.asset(
                        controller.imageInfoList[index].imageText,
                        alignment: Alignment.topCenter,
                        height: height * 0.28,
                        width: width * 0.4,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height * 0.07),
                              if (index == 0) ...{

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'AppText.welcomeTo',
                                      style: TextStyle(fontSize: width* 0.056,fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "AppText.mostlyEvents",
                                 style: TextStyle(fontSize: width* 0.056,fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              } else ...{
                                Text(
                                  controller
                                      .imageInfoList[index].HeadingText,
                                  style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.051),
                                  textAlign: TextAlign.left,
                                ),
                              },
                              SizedBox(height: height* 0.02),
                              Text(
                                controller
                                    .imageInfoList[index].subHeadingText,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1C2541),
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: height* 0.02),
                              if (index == 1)
                                Text(
                                  "AppText.onboardingExtra.capitalize",
                                  style: TextStyle(fontSize: width* 0.031),
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
            () => Padding(
          padding: EdgeInsets.only(
            bottom: height* 0.02,
            right: width* 0.02,
            left: width* 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller.pageController.value,
                count: controller.pages,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.green,
                  dotColor: Colors.grey,
                  radius: 10,
                  spacing: 5,
                  dotHeight: 9,
                  expansionFactor: 3,
                  dotWidth: 20,
                  strokeWidth: 2,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  controller.pageController.value.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut,
                  );
                  if (controller.currentPage.value == 2) {
                    Get.off(Navigationscreen());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(right:width* 0.05),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.095,
                        width: width * 0.2,
                        child: CircularProgressIndicator(
                          value: controller.progress.value,
                          strokeAlign: 1.5,
                          strokeCap: StrokeCap.round,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.green),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Container(
                        height: height * 0.075,
                        width: height * 0.11,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.greenAccent,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
