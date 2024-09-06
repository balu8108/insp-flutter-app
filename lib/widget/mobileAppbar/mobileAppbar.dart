import 'package:flutter/material.dart';

class Mobileappbar extends StatefulWidget {
  const Mobileappbar({super.key});

  @override
  State<Mobileappbar> createState() => _MobileappbarState();
}

class _MobileappbarState extends State<Mobileappbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // INSP logo
                Image.asset(
                  'assests/insplogo.png',
                  height: 40,
                ),

                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
