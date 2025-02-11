import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom Page Transitions for GetX Navigation
class CustomPageTransition {
  // Fade Transition
  static GetPageRoute fade(Widget page) {
    return GetPageRoute(
      page: () => page,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  // Scale Transition (Zoom Effect)
  static GetPageRoute scale(Widget page) {
    return GetPageRoute(
      page: () => page,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  // Slide Transition (Right to Left)
  static GetPageRoute slide(Widget page) {
    return GetPageRoute(
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  // Rotate Transition (Page Rotation)
  static GetPageRoute rotate(Widget page) {
    return GetPageRoute(
      page: () => page,
      transition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 700),
    );
  }
}



/// Home Screen 
 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.to(() => DetailPage(), binding: BindingsBuilder(() {}), transition: Transition.fade),
              child: const Text('Go with Fade'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => DetailPage(), transition: Transition.zoom),
              child: const Text('Go with Scale'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => DetailPage(), transition: Transition.rightToLeft),
              child: const Text('Go with Slide'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => DetailPage(), transition: Transition.circularReveal),
              child: const Text('Go with Rotate'),
            ),
          ],
        ),
      ),
    );
  }
}



/// Detail Page

 
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}


/// Example Of uses

// ElevatedButton(
//   onPressed: () => Get.to(() => DetailPage(), transition: Transition.fade),
//   child: const Text('Go with Fade'),
// );