import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({super.key});

  @override
  State<AttendanceWidget> createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  final List<Map<String, dynamic>> attendanceData = [
    {
      "id": 1,
      "name": "Physics",
      "percentage": 70.0,
      "color": const Color.fromRGBO(227, 141, 141, 1)
    },
    {
      "id": 2,
      "name": "Chemistry",
      "percentage": 80.0,
      "color": const Color.fromRGBO(149, 171, 224, 1)
    },
    {
      "id": 3,
      "name": "Mathematics",
      "percentage": 90.0,
      "color": const Color.fromRGBO(239, 219, 111, 1)
    },
  ];

  @override
  Widget build(BuildContext context) {
    double averagePercentage = _calculateAveragePercentage();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 5, child: INSPHeading('Attendance')),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Handle button press
                },
              )
            ],
          ),
          const SizedBox(height: 17),
          LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600; // Example threshold

              return isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 250, // Increased height
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              PieChart(
                                PieChartData(
                                  sections: _buildPieChartSections(),
                                  borderData: FlBorderData(show: false),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 50,
                                ),
                              ),
                              Positioned(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${averagePercentage.toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(44, 51, 41, 1),
                                      ),
                                    ),
                                    const Text(
                                      'Average',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(44, 51, 41, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ..._buildProgressBars(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 200,
                                child: PieChart(
                                  PieChartData(
                                    sections: _buildPieChartSections(),
                                    borderData: FlBorderData(show: false),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 50,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${averagePercentage.toStringAsFixed(1)}%',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(44, 51, 41, 1),
                                    ),
                                  ),
                                  const Text(
                                    'Average',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(44, 51, 41, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 36),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildProgressBars(),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    return attendanceData.map((data) {
      final value = data['percentage'] as double;
      final color = data['color'] as Color;
      return PieChartSectionData(
        color: color,
        value: value,
        title: '${value.toStringAsFixed(1)}%',
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      );
    }).toList();
  }

  double _calculateAveragePercentage() {
    double sum = attendanceData.fold(
        0, (prev, data) => prev + (data['percentage'] as double));
    return sum / attendanceData.length;
  }

  List<Widget> _buildProgressBars() {
    return attendanceData.map((data) {
      final value = data['percentage'] as double;
      final color = data['color'] as Color;
      final subjectName = data['name'] as String;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 13,
              height: 13,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              subjectName,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 120,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100 * (value / 100),
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${value.toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
