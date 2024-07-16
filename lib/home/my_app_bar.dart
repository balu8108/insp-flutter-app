import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(232, 242, 249, 1),
      title: Text('My Web App'),
      actions: [
        _buildTextButton('Home', () {
          // Handle Home button press
        }),
        _buildTextButton('Calendar', () {
          // Handle Calendar button press
        }),
        _buildTextButton('Assignments', () {
          // Handle Assignments button press
        }),
        _buildTextButton('Library', () {
          // Handle Library button press
        }),
        _buildTextButton('Suggestion', () {
          // Handle Suggestion button press
        }),
        _buildTextButton('INSP Portal', () {
          // Handle INSP Portal button press
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                // Handle profile click
              },
              child: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'T',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildTextButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
