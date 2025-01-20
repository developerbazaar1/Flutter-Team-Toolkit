/// This code you can use to block the screen while uploading any data in firebase or database server
/// It will not allow the user to click anywhere in the screen while data is being uploading.

import 'package:flutter/material.dart';

/// A reusable widget that overlays a semi-transparent blocking screen
/// on top of its child widget. Useful for preventing user interaction
/// during operations such as data uploading or loading.
///
/// Parameters:
/// - [isBlocking]: A boolean flag to determine whether the blocking screen should be displayed.
/// - [child]: The main widget over which the blocking screen will be applied.

class BlockingScreen extends StatelessWidget {
  final bool isBlocking; // Determines whether the screen is blocked
  final Widget child; // The main widget to display

  const BlockingScreen({
    Key? key,
    required this.isBlocking,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The main content of the screen
        child,

        // The blocking overlay, displayed only if isBlocking is true
        if (isBlocking)
          Container(
            color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
            /// Loader is Optional
            // child: const Center(
            //   child: CircularProgressIndicator(
            //     color: Colors.white,
            //   ),
            // ),
          ),
      ],
    );
  }
}
