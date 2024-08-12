import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final String hintText;

  const Dropdown({
    Key? key,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.hintText = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        hint: Text(
          hintText,
          style: const TextStyle(
            color: Color.fromRGBO(58, 53, 65, 0.38),
            fontWeight: FontWeight.w400,
          ),
        ),
        value: selectedValue,
        items: items,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(58, 53, 65, 0.38),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(58, 53, 65, 0.38),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(58, 53, 65, 0.38),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
