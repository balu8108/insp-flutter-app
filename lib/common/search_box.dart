import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';

Widget searchBox(BuildContext context, Function onChanged){
  return SizedBox(
    width: context.isWebOrLandScape() ? MediaQuery.of(context).size.width / 3: MediaQuery.of(context).size.width*0.8,
    child: TextField(
      onChanged: (text) {
        onChanged(text);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50)),
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search),
        //isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
        //isCollapsed: true
        //prefixIconColor: Color(0x88000008)
      ),
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF2C3329)),
    ),
  );
}