import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:insp/widget/card/model/rating_feedback_card_model.dart';

class DonutChart extends StatelessWidget {
  final List<RatingFeedbackCardModal> ratingFeedbackCard;

  const DonutChart({super.key, required this.ratingFeedbackCard});

  @override
  Widget build(BuildContext context) {
    // Calculate average rating
    final totalRating =
        ratingFeedbackCard.fold(0, (sum, item) => sum + item.rating);
    final averageRating = ratingFeedbackCard.isNotEmpty
        ? totalRating / ratingFeedbackCard.length
        : 0;

    // Calculate percentage coverage for each rating
    final ratingCounts = <int, int>{};
    for (var feedback in ratingFeedbackCard) {
      ratingCounts[feedback.rating] = (ratingCounts[feedback.rating] ?? 0) + 1;
    }

    final List<PieChartSectionData> sections =
        ratingCounts.entries.map((entry) {
      final rating = entry.key;
      final count = entry.value;
      final percentage = (count / ratingFeedbackCard.length) * 100;

      return PieChartSectionData(
        color: _getColorForRating(rating),
        value: percentage,
        title: '',
        radius: 50,
        titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                PieChart(
                  PieChartData(
                    sections: sections,
                    centerSpaceRadius: 50,
                    sectionsSpace: 0,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          averageRating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(44, 51, 41, 1),
                          ),
                        ),
                        const Text(
                          'Average',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromRGBO(44, 51, 41, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              final starRating = 5 - index;
              final count = ratingCounts[starRating] ?? 0;
              final percentage = ratingFeedbackCard.isNotEmpty
                  ? (count / ratingFeedbackCard.length) * 100
                  : 0;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _getColorForRating(starRating),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$starRating Star',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(44, 51, 41, 1),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 150,
                      height: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: percentage / 100,
                            backgroundColor: Colors.transparent,
                            color: _getColorForRating(starRating),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${percentage.toStringAsFixed(1)}%',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(44, 51, 41, 1),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color _getColorForRating(int rating) {
    switch (rating) {
      case 1:
        return const Color.fromRGBO(149, 211, 224, 1);
      case 2:
        return const Color.fromRGBO(149, 170, 224, 1);
      case 3:
        return const Color.fromRGBO(121, 214, 121, 1);
      case 4:
        return const Color.fromRGBO(239, 219, 111, 1);
      case 5:
        return const Color.fromRGBO(227, 141, 141, 1);
      default:
        return Colors.grey;
    }
  }
}
