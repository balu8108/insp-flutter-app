import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/feedback/all_student_feedback_response_model.dart';
import 'package:insp/pages/teacher/suggestion/widget/CustomPaginatedTable.dart';

class DataTableExampleApp extends StatefulWidget {
  const DataTableExampleApp(
      {super.key,
      required this.data,
      required this.totalpage,
      required this.page,
      required this.getpreviousornextFeedback,
      required this.deleteFeedback});
  final List<FeedbackModel> data;
  final int totalpage, page;
  final Function(BuildContext, int) getpreviousornextFeedback;
  final Function(BuildContext, int) deleteFeedback;
  @override
  _DataTableExampleAppState createState() => _DataTableExampleAppState();
}

class _DataTableExampleAppState extends State<DataTableExampleApp> {
  // State management for columns and rows
  late List<CustomDataColumn> columns;
  late List<CustomDataRow> rows;

  @override
  void initState() {
    super.initState();
    // Initialize columns
    columns = [
      CustomDataColumn(label: 'S.No'),
      CustomDataColumn(label: 'Date & Time'),
      CustomDataColumn(label: 'Student Name'),
      CustomDataColumn(label: 'Feedback'),
      CustomDataColumn(label: 'Action'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Initialize rows
    if (widget.data.isNotEmpty) {
      rows = widget.data.map((data) {
        return CustomDataRow(
          cells: [
            CustomDataCell(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add padding from top and bottom
                    child: Text('${data.id}'))),
            CustomDataCell(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add padding from top and bottom
                    child: Text(data.createdAt))),
            CustomDataCell(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add padding from top and bottom
                    child: Text(data.studentName))),
            CustomDataCell(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0), // Add padding from top and bottom
                    child: Text(data.feedback))),
            CustomDataCell(
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  widget.deleteFeedback(context, data.id);
                },
              ),
            ), // Example action text
          ],
        );
      }).toList();
    } else {
      rows = [];
    }

    return CustomPaginatedTable(
        columns: columns,
        rows: rows,
        rowsPerPage: 10,
        totalPages: widget.totalpage,
        page: widget.page,
        getpreviousornextFeedback: widget.getpreviousornextFeedback);
  }
}
