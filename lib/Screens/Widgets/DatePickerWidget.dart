import 'package:flutter/material.dart';


class DatePickerWidget {
 static  DateTime? selectedDate ;

  _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      return pickedDate;
    }
  }
}

