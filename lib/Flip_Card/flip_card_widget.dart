import 'package:animated_text_kit/animated_text_kit.dart'; // For animated text effects.
import 'package:flip_card/flip_card.dart'; // For creating the flip card effect.
import 'package:flutter/material.dart'; // Core Flutter framework.
import 'package:flutter_markdown/flutter_markdown.dart'; // For rendering Markdown content.

class FlipCardWidget extends StatefulWidget {
  const FlipCardWidget({Key? key}) : super(key: key);

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> {
  @override
  Widget build(BuildContext context) {
    // Controller for scrolling inside the Markdown widget.
    final controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        // AppBar for the Flip Card Widget screen.
        foregroundColor: Colors.white,
        title: const Text('Flip Card'), // Title of the screen.
        backgroundColor: Colors.cyan, // AppBar background color.
      ),
      primary: true, // Marks this scaffold as primary for accessibility focus.
      body: Center(
        // Center the Flip Card widget on the screen.
        child: FlipCard(
          fill: Fill.fillBack, // Ensures the back matches the size of the front.
          direction: FlipDirection.HORIZONTAL, // Flips horizontally by default.
          front: Container(
            // Front side of the card.
            padding: const EdgeInsets.all(10),
            height: 250, // Fixed height for the card.
            width: 250, // Fixed width for the card.
            decoration: const BoxDecoration(
              color: Colors.cyan, // Background color for the card.
              boxShadow: [
                BoxShadow(blurRadius: 10.0, color: Colors.grey), // Card shadow.
              ],
            ),
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  repeatForever: true, // Loop the animated text indefinitely.
                  animatedTexts: [
                    RotateAnimatedText('Hi'), // First text.
                    RotateAnimatedText('Touch the card to flip'), // Second text.
                    RotateAnimatedText('Have a good day'), // Third text.
                  ],
                ),
              ),
            ),
          ),
          back: Container(
            // Back side of the card.
            padding: const EdgeInsets.all(10),
            height: 250,
            width: 250,
            decoration: const BoxDecoration(
              color: Colors.cyan,
              boxShadow: [
                BoxShadow(blurRadius: 10.0, color: Colors.grey), // Card shadow.
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  // Markdown widget to display text in Markdown format.
                  child: Markdown(
                    controller: controller, // Enables scroll inside Markdown.
                    selectable: true, // Makes the text selectable.
                    data: 'Flip Card By Tushar', // Content to display on the back.
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
