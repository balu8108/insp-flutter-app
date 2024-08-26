import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LivePollResult extends StatelessWidget {
  LivePollResult();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading('Poll Result')),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendanceData.length,
              itemBuilder: (context, index) {
                final value = attendanceData[index]['percentage'] as double;
                final subjectName = attendanceData[index]['name'] as String;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subjectName,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${value.toStringAsFixed(1)}%',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Calculate the width as a percentage of the available width
                          double percentageWidth =
                              (constraints.maxWidth * value) / 100;

                          return Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: percentageWidth,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(60, 141, 188, 1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ]));
  }
}

final List<Map<String, dynamic>> attendanceData = [
  {
    "id": 1,
    "name": "A",
    "percentage": 70.0,
  },
  {
    "id": 2,
    "name": "B",
    "percentage": 80.0,
  },
  {
    "id": 3,
    "name": "C",
    "percentage": 90.0,
  },
  {
    "id": 4,
    "name": "A",
    "percentage": 70.0,
  },
  {
    "id": 5,
    "name": "B",
    "percentage": 80.0,
  },
  {
    "id": 6,
    "name": "C",
    "percentage": 100.0,
  },
  {
    "id": 7,
    "name": "A",
    "percentage": 50.0,
  },
  {
    "id": 8,
    "name": "B",
    "percentage": 80.0,
  },
  {
    "id": 9,
    "name": "C",
    "percentage": 90.0,
  },
];
