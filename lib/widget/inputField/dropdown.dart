import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? selectedValue;
  final String? selectedValueError;
  final ValueChanged<String?>? onChanged;
  final String hintText;

  const Dropdown({
    super.key,
    required this.items,
    this.selectedValue,
    this.selectedValueError,
    this.onChanged,
    this.hintText = "Select",
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        // Clips the overflowing content
        child: SizedBox(
      width: double.infinity, // Full width
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        hint: Text(
          hintText,
          style: const TextStyle(
              color: Color(0x613A3541),
              fontSize: 16,
              overflow: TextOverflow.ellipsis),
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
          errorText: selectedValueError!.isNotEmpty ? selectedValueError : null,
          errorStyle: const TextStyle(color: Colors.red),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: selectedValueError!.isNotEmpty
                  ? Colors.red
                  : const Color.fromRGBO(58, 53, 65, 0.38),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
        ),
      ),
    ));
  }
}
