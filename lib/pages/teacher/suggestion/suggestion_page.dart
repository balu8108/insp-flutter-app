import 'package:flutter/material.dart';

class MyDataSource extends DataTableSource {
  @override
  int get rowCount => 3;

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('0')),
            DataCell(Text('03/01/2024')),
            DataCell(Text('Abhishek Mali')),
            DataCell(
              SizedBox(
                width: 150, // Set max width here
                child: const Text(
                  'Recording not available in iPhone 14 Plus',
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            DataCell(Text('Action'))
          ],
        );
      case 1:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('0')),
            DataCell(Text('03/01/2024')),
            DataCell(Text('Abhishek Mali')),
            DataCell(
              SizedBox(
                width: 150, // Set max width here
                child: const Text(
                  'Pls add poll feature in recording also like in unacademy special class for those who are attempting by pausing the video and then answering the questions',
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            DataCell(Text('Action'))
          ],
        );
      case 2:
        return const DataRow(
          cells: <DataCell>[
            DataCell(Text('0')),
            DataCell(Text('03/01/2024')),
            DataCell(Text('Abhishek Mali')),
            DataCell(
              SizedBox(
                width: 150, // Set max width here
                child: const Text(
                  'Google Chrome Version 122.0.6261.71 (Official Build) (64-bit) intel core i5 Ram 8.00 GB (7.78 GB usable) network upload and download speed 50mb/s not able too see lecture of kinetic theory of gases 1st classs champs batch',
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
            DataCell(Text('Action'))
          ],
        );
      default:
        return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

final DataTableSource dataSource = MyDataSource();

void main() => runApp(const DataTableExampleApp());

class DataTableExampleApp extends StatelessWidget {
  const DataTableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: SuggestionPage(),
      ),
    );
  }
}

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text('S.No'),
        ),
        DataColumn(
          label: Text('Date & time'),
        ),
        DataColumn(
          label: Text('Student Name'),
        ),
        DataColumn(
          label: Text('Feedback'),
        ),
        DataColumn(
          label: Text('Action'),
        ),
      ],
      source: dataSource,
    );
  }
}
