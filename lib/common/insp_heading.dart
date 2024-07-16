import 'package:flutter/material.dart';

Widget INSPHeading(String heading){
  return Row(
    children: [
      Container(
        width: 12,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF3C8DBC),
        ),
      ),
      const SizedBox(
        width: 8,
      ),
      Text(
        heading,
          style: const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis))
    ],
  );
}