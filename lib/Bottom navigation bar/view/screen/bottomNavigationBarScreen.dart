import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/bottomNavigationBarController.dart';
import '../widget/NavigationManu.dart';

class NavigationMenuScreen extends StatelessWidget {
  const NavigationMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationMenuController());

    return Scaffold(

      // -- Page View
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      // -- Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(SearchScreen()),
        backgroundColor: Colors.green,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // -- Navigation Menu
      bottomNavigationBar: const NavigationMenu(),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text('Search'),),

      body:
        Center(child: Text('search screen'),),

    );
  }
}