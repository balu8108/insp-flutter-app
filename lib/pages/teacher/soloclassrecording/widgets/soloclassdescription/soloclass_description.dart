import 'package:flutter/material.dart';

class SoloclassDescription extends StatelessWidget {
  const SoloclassDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context)
            .size
            .height, // Take full height of the screen
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(232, 242, 249, 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(92, 92, 92, 0.12), // Shadow color
              offset: Offset(2, 2), // x and y offset
              blurRadius: 13, // Blur radius
              spreadRadius: 0, // Spread radius (optional, default is 0)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 12,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(60, 141, 188, 1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text("Solo Recording",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(44, 51, 41, 1),
                        decoration: TextDecoration.none,
                      )),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Alternating Current",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(44, 51, 41, 1),
                  decoration: TextDecoration.none,
                ),
              ),
              const SizedBox(height: 25),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(44, 51, 41, 1),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "This is a description of the solo recording",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(44, 51, 41, 0.47),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Agenda",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(44, 51, 41, 1),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(4, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Add space between items
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.only(
                                  right: 10), // Space between circle and text
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(44, 51, 41, 0.47),
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "This is a description of the agenda item and I will be testing all the information related to it ${index + 1}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Column(
                children: [
                  Text(
                    "File",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(44, 51, 41, 1),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
