import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NavigationMenuController extends GetxController {
  static NavigationMenuController get instance => Get.find();

  final int? preferredIndex;
  NavigationMenuController({this.preferredIndex});

  // Variables
  Rx<int> selectedIndex = 0.obs;
  late PageController pageController;
   List<BottomBarItemModel> bottomBarItems = [
    BottomBarItemModel(
      title: "Home",
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined,
    ),
    BottomBarItemModel(
      title: "Your Jobs",
      selectedIcon: Icons.breakfast_dining,
      unselectedIcon: Icons.breakfast_dining_outlined,
    ),
    BottomBarItemModel(
      title: "Community",
      selectedIcon: Icons.business,
      unselectedIcon: Icons.business_outlined,
    ),
    BottomBarItemModel(
      title: "Profile",
      selectedIcon: Icons.account_box,
      unselectedIcon: Icons.account_box_outlined,
    ),
  ];

  @override
  void onInit() async{
    selectedIndex.value = preferredIndex ?? 0;
    pageController = PageController(initialPage: selectedIndex.value);

    super.onInit();
  }

  @override
  onReady()async {
    // print('---------------${userDetails.user.value.kycDocument!.verified}');
    // if(await userDetails.user.value.kycDocument!.verified==false)
      //ShowDialog.completeKyc();
    // if(userDetails.user.value.kycDocument!.verified!=true)
    //  ShowDialog.unlockOpportunities();
    super.onReady();
  }

  // Screens
  List<Widget> pages = [
    HomeScreen(),
     MyJobsScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Update the current page when Tapped
  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  // On Page Changed
  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeScreen'),),
    );
  }
}class MyJobsScreen extends StatelessWidget {
  const MyJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('MyJobsScreen'),),
    );
  }
}
class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('CommunityScreen'),),
    );
  }
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ProfileScreen'),),
    );
  }
}
class BottomBarItemModel {
  final String title;
  final IconData selectedIcon;
  final IconData unselectedIcon;

  BottomBarItemModel({
    required this.title,
    required this.selectedIcon,
    required this.unselectedIcon,
  });
}
