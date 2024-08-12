import 'package:flutter/material.dart';

class TextFieldWithoutSuffix extends StatelessWidget {
  final String? selectedValueError;
  final ValueChanged<String?>? onChanged;
  final String hintText;

  const TextFieldWithoutSuffix({
    Key? key,
    this.selectedValueError,
    this.onChanged,
    this.hintText = "Select",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 2,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color.fromRGBO(58, 53, 65, 0.38),
            fontWeight: FontWeight.w400),
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
            color: Color.fromRGBO(58, 53, 65, 0.38),
            width: 1.0,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      ),
    );
  }
}
