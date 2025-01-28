import 'dart:io';
import 'dart:math'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectedImageContainer extends StatelessWidget {
  final SelectedImageController controller; // Pass the controller to make it reusable
  final Color containerColor;
  final double imageSize;
  final double spacing;

  const SelectedImageContainer({
    Key? key,
    required this.controller,
    this.containerColor = const Color(0xFFEFEFEF),
    this.imageSize = 100.0,
    this.spacing = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Row: Add Image Button + Preview of First Two Images
        Row(
          children: [
            // Add Image Button
            GestureDetector(
              onTap: () async {
                if (controller.selectedImages.length < controller.maxImages) {
                  await controller.pickImage();
                }
              },
              child: Container(
                height: imageSize,
                width: imageSize,
                decoration: BoxDecoration(
                  color: controller.selectedImages.length < controller.maxImages
                      ? containerColor
                      : Colors.grey.shade400, // Greyed out if limit reached
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_circle,
                    size: 30,
                    color: controller.selectedImages.length < controller.maxImages
                        ? Colors.black
                        : Colors.grey, // Greyed out if limit reached
                  ),
                ),
              ),
            ),
            SizedBox(width: spacing),
            // Preview of First Two Images
            Obx(() => Row(
                  children: controller.selectedImages
                      .sublist(0, min(2, controller.selectedImages.length))
                      .map(
                        (image) => Stack(
                          children: [
                            // Image Preview
                            Container(
                              margin: EdgeInsets.only(right: spacing),
                              height: imageSize,
                              width: imageSize,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: FileImage(image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Remove Icon
                            Positioned(
                              right: 10,
                              top: 0,
                              child: GestureDetector(
                                onTap: () => controller.selectedImages.remove(image),
                                child: Icon(Icons.remove_circle, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                )),
          ],
        ),
        SizedBox(height: spacing),
        // Additional Rows for Remaining Images
        if (controller.selectedImages.length > 2)
          Row(
            children: controller.selectedImages
                .sublist(2, controller.selectedImages.length)
                .map(
                  (image) => Stack(
                    children: [
                      // Image Preview
                      Container(
                        margin: EdgeInsets.only(right: spacing),
                        height: imageSize,
                        width: imageSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: FileImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Remove Icon
                      Positioned(
                        right: 10,
                        top: 0,
                        child: GestureDetector(
                          onTap: () => controller.selectedImages.remove(image),
                          child: Icon(Icons.remove_circle, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
