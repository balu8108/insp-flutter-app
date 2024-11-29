import 'package:flutter/material.dart';
import 'package:insp/utils/extensions.dart';

class KickPeerPopup extends StatelessWidget {
  const KickPeerPopup({super.key, required this.callKickApi});

  final void Function() callKickApi;

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
      title: Row(
        children: [
          const Text("Kick Student",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: const SizedBox(
        height: 50,
        width: 400, // Set your desired width here
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns the column to the start (top)
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the start (left)
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure you want to kick this student out of the class?",
              style: TextStyle(
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
                onPressed: () {
                  Navigator.pop(context);
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
                child: const Text("No"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  callKickApi();
                  Navigator.of(context).pop();
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
                child: const Text("Yes"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
