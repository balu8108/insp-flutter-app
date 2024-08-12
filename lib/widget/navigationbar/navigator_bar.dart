import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({Key? key, required this.child}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Add navigation logic based on selectedIndex if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _navbar(),
    );
  }

  Widget _navbar() {
    List<IconData> navIcons = [
      Icons.home,
      Icons.book,
      Icons.library_books,
      Icons.calendar_month
    ];

    return Container(
      height: 80,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navIcons.length, (index) {
          return IconButton(
            icon: Icon(
              navIcons[index],
              color: selectedIndex == index ? Colors.blue : Colors.grey,
            ),
            onPressed: () => _onItemTapped(index),
          );
        }),
      ),
    );
  }
}
