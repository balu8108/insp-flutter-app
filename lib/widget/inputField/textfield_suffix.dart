import 'package:flutter/material.dart';

class TextFieldSuffix extends StatelessWidget {
  final String? selectedValue;
  final String? selectedValueError;
  final VoidCallback? onChanged;
  final String hintText;
  final IconData icon;

  const TextFieldSuffix({
    Key? key,
    this.selectedValue,
    this.selectedValueError,
    this.onChanged,
    this.hintText = "Select",
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      controller: TextEditingController()..text = selectedValue!,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0x613A3541),
        ),
        contentPadding: const EdgeInsets.all(14.0),
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
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(icon),
          onPressed: onChanged,
        ),
      ),
    );
  }
}
