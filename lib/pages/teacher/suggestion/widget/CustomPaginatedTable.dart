import 'package:flutter/material.dart';

// Custom DataColumn class
class CustomDataColumn {
  final String label;

  CustomDataColumn({required this.label});
}

// Custom DataRow class
class CustomDataRow {
  final List<CustomDataCell> cells;

  CustomDataRow({required this.cells});
}

// Custom DataCell class
class CustomDataCell {
  final Widget child;

  CustomDataCell({required this.child});
}

class CustomPaginatedTable extends StatefulWidget {
  final List<CustomDataColumn> columns;
  final List<CustomDataRow> rows;
  final int rowsPerPage, totalPages, page;
  final Function(BuildContext, int) getpreviousornextFeedback;

  const CustomPaginatedTable(
      {super.key, required this.columns,
      required this.rows,
      required this.rowsPerPage,
      required this.totalPages,
      required this.page,
      required this.getpreviousornextFeedback});

  @override
  _CustomPaginatedTableState createState() => _CustomPaginatedTableState();
}

class _CustomPaginatedTableState extends State<CustomPaginatedTable> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MediaQuery.of(context).size.width, // Full screen width
              child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    width: 1,
                    color: Colors.grey[300]!, // Light gray color
                  ),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1), // S.No column
                  1: FlexColumnWidth(2), // Date & time column
                  2: FlexColumnWidth(2), // Student Name column
                  3: FlexColumnWidth(3), // Feedback column
                  4: FlexColumnWidth(1), // Action column
                },
                children: [
                  _buildHeaderRow(),
                  ..._buildDataRows(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildPaginationControls(widget.totalPages),
      ],
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: widget.columns
          .map((column) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  column.label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
    );
  }

  List<TableRow> _buildDataRows() {
    const int startIndex = 0;
    const int endIndex = 10;

    return widget.rows.isNotEmpty
        ? widget.rows
            .sublist(startIndex,
                endIndex > widget.rows.length ? widget.rows.length : endIndex)
            .map((row) => TableRow(
                  children: row.cells
                      .map((cell) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: cell.child,
                          ))
                      .toList(),
                ))
            .toList()
        : [];
  }

  Widget _buildPaginationControls(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 0
              ? () {
                  widget.getpreviousornextFeedback(context, widget.page - 2);
                  setState(() {
                    currentPage--;
                  });
                }
              : null,
        ),
        Text('Page ${currentPage + 1} of $totalPages'),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages - 1
              ? () {
                  widget.getpreviousornextFeedback(context, widget.page);
                  setState(() {
                    currentPage++;
                  });
                }
              : null,
        ),
      ],
    );
  }
}
