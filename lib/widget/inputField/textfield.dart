import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDefault extends StatefulWidget {
  final String? selectedValue;
  final String? selectedValueError;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool enableText;

  const TextFieldDefault({
    super.key,
    this.selectedValue,
    this.selectedValueError,
    this.onChanged,
    this.hintText = "Select",
    this.enableText = true,
  });

  @override
  _TextFieldDefaultState createState() => _TextFieldDefaultState();
}

class _TextFieldDefaultState extends State<TextFieldDefault> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.selectedValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enableText,
      onChanged: widget.onChanged,
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0x613A3541),
        ),
        contentPadding: const EdgeInsets.all(14.0),
        errorText: widget.selectedValueError?.isNotEmpty == true
            ? widget.selectedValueError
            : null,
        errorStyle: const TextStyle(color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
            color: widget.selectedValueError?.isNotEmpty == true
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
      ),
    );
  }
}
