import 'package:get/get.dart';

class DatePickerController extends GetxController {
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final days = List.generate(31, (index) => (index + 1).toString());
  final years = List.generate(100, (index) => (DateTime.now().year - index).toString());

  var selectedMonthIndex = 0.obs;
  var selectedDayIndex = 0.obs;
  var selectedYearIndex = 0.obs;

  var errorMessage = ''.obs; // Observable for the error message

  DateTime get selectedDate => DateTime(
    int.parse(years[selectedYearIndex.value]),
    selectedMonthIndex.value + 1,
    selectedDayIndex.value + 1,
  );

  /// Validates if the selected date is in the future or less than 18 years old
  bool validateDate() {
    final selected = selectedDate;
    final today = DateTime.now();
    final age = today.year - selected.year -
        ((today.month < selected.month || (today.month == selected.month && today.day < selected.day)) ? 1 : 0);

    if (selected.isAfter(today)) {
      errorMessage.value = 'Date of Birth cannot be in the future.';
      return false;
    }

    // if (age < 18) {
    //   errorMessage.value = 'You must be at least 18 years old.';
    //   return false;
    // }

    errorMessage.value = ''; // Clear error if validation passes
    return true;
  }
}
