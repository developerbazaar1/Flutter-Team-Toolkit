import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/date_picker_controller.dart';
import '../widget/custom_date_picker.dart';

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DatePickerController controller = Get.put(DatePickerController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Text(
                  "Date of Birth:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                CustomDatePicker(
                  onDateSelected: (date) {
                    // Optional: Handle date selection outside the widget
                    print("Selected Date: $date");
                  },
                ),

                SizedBox(height: 20),
                Obx(
                  () => Text(
                    controller.selectedDate.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.validateDate()) {
            // Proceed if validation passes
            print("Selected Date: ${controller.selectedDate}");
          }
        },
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    );
  }
}

