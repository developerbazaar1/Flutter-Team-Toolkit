import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomNavigationItem.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      // Shadow

      child: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
        padding: EdgeInsets.zero,
        height: height * 0.09,
        notchMargin: 8,
        color: Colors.white,
        child: Row(
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavBarItem(index: 0),
                  BottomNavBarItem(index: 1),
                ],
              ),
            ),
            SizedBox(width: width * 0.18), // Space for Search Icon
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavBarItem(index: 2),
                  BottomNavBarItem(index: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}