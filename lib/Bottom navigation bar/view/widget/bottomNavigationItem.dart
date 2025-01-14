import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/bottomNavigationBarController.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;

  const BottomNavBarItem({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = NavigationMenuController.instance;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Obx(
          () {
        final isSelected = controller.selectedIndex.value == index;
        return Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () => controller.onItemTapped(index),
              child: Column(
                children: [
                  Container(
                    width: isSelected ? width * 0.18 : width * 0.15,
                    height: 4,
                    color: isSelected ? Colors.green : Colors.transparent,
                  ),
                  SizedBox(height: height * 0.01),
                  Icon(
                    isSelected
                        ? controller.bottomBarItems[index].unselectedIcon
                        : controller.bottomBarItems[index].selectedIcon,
                  //  height: height * 0.035,
                  //   placeholderBuilder: (context) => SizedBox(
                  //     height: height * 0.03,
                  //     width: height * 0.03,
                  //     child: const CircularProgressIndicator(),
                  //   ),
                  ),
                  SizedBox(height: height * 0.006),
                  Text(
                      controller.bottomBarItems[index].title,
                    style:TextStyle(
                    fontSize: width* 0.031,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.green : Colors.black,
                  )),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}