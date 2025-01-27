import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/date_picker_controller.dart';


class CustomDatePicker extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DatePickerController()); // Initialize the controller

    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPickerContainer(
              width: width * 0.28,
              height: height * 0.2,
              items: controller.months,
              selectedIndex: controller.selectedMonthIndex,
              onSelectedItemChanged: (index) {
                controller.selectedMonthIndex.value = index;
                onDateSelected(controller.selectedDate);
              },
            ),
            _buildPickerContainer(
              width: width * 0.28,
              height: height * 0.2,
              items: controller.days,
              selectedIndex: controller.selectedDayIndex,
              onSelectedItemChanged: (index) {
                controller.selectedDayIndex.value = index;
                onDateSelected(controller.selectedDate);
              },
            ),
            _buildPickerContainer(
              width: width * 0.28,
              height: height * 0.2,
              items: controller.years,
              selectedIndex: controller.selectedYearIndex,
              onSelectedItemChanged: (index) {
                controller.selectedYearIndex.value = index;
                onDateSelected(controller.selectedDate);
              },
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(
              () => Text(
            controller.errorMessage.value,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ), // Display the error message
      ],
    );
  }

  Widget _buildPickerContainer({
    required double width,
    required double height,
    required List<String> items,
    required RxInt selectedIndex,
    required ValueChanged<int> onSelectedItemChanged,
  }) {
    return Obx(
          () => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: CupertinoPicker(
          scrollController:
          FixedExtentScrollController(initialItem: selectedIndex.value),
          itemExtent: 40,
          onSelectedItemChanged: onSelectedItemChanged,
          magnification: 1.2,
          useMagnifier: true,
          backgroundColor: Colors.black,
          children: items
              .map((item) => Center(
            child: Text(
              item,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ))
              .toList(),
        ),
      ),
    );
  }
}
