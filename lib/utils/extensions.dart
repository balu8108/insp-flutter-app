import 'package:flutter/cupertino.dart';

extension StringExtensions on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension ContextExtensions on BuildContext {
  bool isWebOrLandScape() {
    return MediaQuery.of(this).size.width > 600;
  }
}
