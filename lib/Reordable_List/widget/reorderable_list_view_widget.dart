import 'package:flutter/material.dart';

/// A reusable widget that displays a reorderable list of items.
/// The widget allows dynamic customization through the parameters provided.
/// 
class ReorderableListViewWidget extends StatefulWidget {
  // Title to be displayed in the AppBar
  final String title; 

  /// Constructor to initialize the widget with the required details.
  const ReorderableListViewWidget({
    Key? key,
    required this.title, 
  }) : super(key: key);

  @override
  State<ReorderableListViewWidget> createState() =>
      _ReorderableListViewWidgetState();
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  // A list of integers representing the items to display in the list.
  final List<int> items = List.generate(30, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar to display the title of the widget
      appBar: AppBar(
        title: Text(widget.title), // Title passed from the widget parameters
        foregroundColor: Colors.white, // Text color
        backgroundColor: Colors.cyan, // Background color
      ),
      body: Stack(
        children: [
          // ReorderableListView: Enables drag-and-drop reordering of list items
          ReorderableListView(
            // Create a list of tiles to display
            children: List.generate(
              items.length,
              (index) => ListTile(
                key: Key("$index"), // Unique key for each item
                tileColor: items[index].isOdd
                    ? Colors.white // White background for odd items
                    : Colors.grey.shade200, // Light grey background for even items
                title: Text("Task ${items[index]}"), // Display task number
                trailing: const Icon(Icons.drag_indicator), // Drag icon
              ),
            ),
            // Logic to reorder the list when an item is dragged
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1; // Adjust the index when moving items down
                }
                final int item = items.removeAt(oldIndex); // Remove the old item
                items.insert(newIndex, item); // Insert it at the new position
              });
            },
          ),
        ],
      ),
    );
  }
}


/// Find the USAGE of the widget :
//  ReorderableListViewWidget(
//   title: "Task Manager", // The title displayed in the AppBar
// ),
