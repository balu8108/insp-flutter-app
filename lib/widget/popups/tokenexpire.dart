import 'package:flutter/material.dart';
import 'package:insp/pages/login/login_screen.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/localstorage.dart';

class TokenExpired extends StatelessWidget {
  const TokenExpired({super.key});

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
            "Token Expired",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
        ],
      ),
      content: const SizedBox(
        height: 50,
        width: 500, // Set your desired width here
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Aligns the column to the start (top)
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the start (left)
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "It seems that your session has expired. To continue using the application, please log in again.",
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
                onPressed: () async {
                  await logoutData("insp_user_profile");
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const LoginScreen(),
                      transitionDuration:
                          Duration.zero, // No transition duration
                      reverseTransitionDuration:
                          Duration.zero, // No reverse transition
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child; // Directly return the child without any animation
                      },
                    ),
                    (route) => false, // Remove all previous routes
                  );
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
