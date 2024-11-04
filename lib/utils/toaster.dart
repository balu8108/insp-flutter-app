import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToast(BuildContext context, String message, ToastificationType type) {
  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(message),
    alignment: Alignment.topRight,
  );
}
