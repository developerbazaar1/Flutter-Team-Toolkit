import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectedImageController extends GetxController {
  var selectedImages = <File>[].obs;
  final int maxImages = 5;

  // Pick an image from the gallery
  Future<void> pickImage() async {
    if (selectedImages.length >= maxImages) {
      // Show a message if the limit is reached
      Get.snackbar('Limit Reached', 'You can only add up to $maxImages images.');
      return;
    }

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImages.add(File(pickedFile.path));
    } else {
      Get.snackbar('No Image Selected', 'Please select an image.');
    }
  }
}
