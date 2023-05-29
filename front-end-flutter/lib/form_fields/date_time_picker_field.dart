import 'package:flutter/material.dart';
import 'package:uni_drive/form_fields/time_picker_field.dart';

import 'date_picker_field.dart';


class DateTimePickerField extends StatelessWidget {
  final String dateFormControlName;
  final String timeFormControlName;
  final String dateLabel;
  final String timeLabel;
  final DateTime firstDate;
  final DateTime lastDate;
  final String languageCode;
  final String? tooltipTitle;
  final String? tooltipDescription;
  //todo split for date and time
  final InputDecoration decoration;

  const DateTimePickerField({
    required this.dateFormControlName,
    required this.timeFormControlName,
    required this.dateLabel,
    required this.timeLabel,
    required this.firstDate,
    required this.lastDate,
    required this.languageCode,
    this.tooltipTitle,
    this.tooltipDescription,
    this.decoration = const InputDecoration(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DatePickerField(
            formControlName: dateFormControlName,
            label: dateLabel,
            firstDate: firstDate,
            lastDate: lastDate,
            languageCode: languageCode,
            decoration: decoration,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TimePickerField(
            formControlName: timeFormControlName,
            label: timeLabel,
            tooltipTitle: tooltipTitle,
            tooltipDescription: tooltipDescription,
            decoration: decoration,
          ),
        ),
      ],
    );
  }
}
