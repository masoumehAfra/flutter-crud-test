import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/app_const_size/app_space.dart';
import '../../domain/entities/date_entity.dart';

class CrudTestDatePicker extends StatefulWidget {
  final Function(DateEntity date) dateChanged;
  final String? errorText;
  final bool showError;

  const CrudTestDatePicker({
    super.key,
    required this.dateChanged,
    this.errorText,
    this.showError = false,
  });

  @override
  State<CrudTestDatePicker> createState() => _CrudTestDatePickerState();
}

class _CrudTestDatePickerState extends State<CrudTestDatePicker> {
  String _dateLabel = "Date Of Birth";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickDateTime(context);
      },
      child: InputDecorator(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: const BorderSide(color: Color(0xff8690A2), width: 1.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
            borderSide: const BorderSide(color: Color(0xff8690A2), width: 1.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: CrudTestSpace.margin16,
              vertical: CrudTestSpace.margin16),
          errorText: widget.errorText,
        ),
        child: Text(
          _dateLabel,
          style: const TextStyle(
              color: Color(0xff8690A2),
              fontWeight: FontWeight.w400,
              fontSize: 16),
        ),
      ),
    );
  }

  Future<void> _pickDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateLabel = "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
      });
      widget.dateChanged(DateEntity(
          day: pickedDate.day, month: pickedDate.month, year: pickedDate.year));
    }
  }
}
