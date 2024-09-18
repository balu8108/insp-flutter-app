import 'package:flutter/material.dart';
import 'package:insp/utils/extensions.dart';

Widget searchBox(BuildContext context, Function onChanged) {
  return SizedBox(
    width: context.isWebOrLandScape()
        ? MediaQuery.of(context).size.width / 5
        : MediaQuery.of(context).size.width * 0.3,
    child: TextField(
      onChanged: (text) {
        onChanged(text);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search...',
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0), // Padding for the icon
          child: Icon(
            Icons.search,
            color: Colors.grey[600], // Icon color
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 0, horizontal: 16), // Adjust padding
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xFF2C3329), // Text color
      ),
    ),
  );
}
