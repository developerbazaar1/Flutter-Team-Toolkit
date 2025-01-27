# scrollable_date_picker
A reusable Flutter widget with scrolling feature for selecting a date with built-in validation, powered by GetX for state management.

## Features
Date Selection:

* Three pickers for month, day, and year using CupertinoPicker.
* Automatically updates the selected date in real-time.

Validation:

* Ensures the date is not in the future.
* Checks if the user is 18 years or older.

Modular Design:

* Independent CustomDatePicker widget.
* DatePickerController manages state and validation.

How It Works
* Date is updated as the user interacts with the pickers.
* Validation occurs when the button is pressed.
* Reusability ensures seamless integration into other screens.

dependencies
get: ^4.6.6