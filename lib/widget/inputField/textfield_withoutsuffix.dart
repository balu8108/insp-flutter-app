import 'package:flutter/material.dart';

class TextFieldWithoutSuffix extends StatefulWidget {
  TextFieldWithoutSuffix(
      {this.selectedValueError,
      this.onChanged,
      this.hintText = "Select",
      this.value});

  final String? selectedValueError;
  final ValueChanged<String?>? onChanged;
  final String hintText;
  final String? value;

  @override
  _TextFieldWithoutSuffixState createState() => _TextFieldWithoutSuffixState();
}

class _TextFieldWithoutSuffixState extends State<TextFieldWithoutSuffix> {
  _TextFieldWithoutSuffixState();

  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
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
        errorText: widget.selectedValueError!.isNotEmpty
            ? widget.selectedValueError
            : null,
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: widget.selectedValueError!.isNotEmpty
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
