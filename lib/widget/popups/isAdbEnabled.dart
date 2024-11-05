import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insp/utils/extensions.dart';

class ADBEnablePopup extends StatelessWidget {
  const ADBEnablePopup({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
      title: const Row(
        children: [
          Text(
            "Detected",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
        ],
      ),
      content: SizedBox(
        height: 200,
        width: 500, // Set your desired width here
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns the column to the start (top)
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the start (left)
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  SystemNavigator.pop(); // Close the app
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(60, 141, 188, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text("Ok"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
