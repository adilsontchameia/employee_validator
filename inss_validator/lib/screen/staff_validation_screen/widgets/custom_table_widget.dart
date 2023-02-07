import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class BuildTable extends StatefulWidget {
  const BuildTable({
    super.key,
    required this.fivethColumn,
    required this.secondColumn,
    required this.thirdColumn,
    required this.firstColumn,
    required this.fourthColumn,
    required this.sixthColumn,
    required this.fivethRow,
    required this.secondRow,
    required this.thirdRow,
    required this.firstRow,
    required this.fourthRow,
    required this.sixthRow,
  });
  final String firstColumn,
      secondColumn,
      thirdColumn,
      fourthColumn,
      fivethColumn,
      sixthColumn;
  final String firstRow, secondRow, thirdRow, fourthRow, fivethRow, sixthRow;
  @override
  State<BuildTable> createState() => _BuildTableState();
}

class _BuildTableState extends State<BuildTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: DataTable2(
        headingRowHeight: 50,
        columnSpacing: 1,
        horizontalMargin: 5,
        // Datatable widget that have the property columns and rows.
        columns: [
          DataColumn(label: Text(widget.firstColumn)),
          DataColumn(label: Text(widget.secondColumn)),
          DataColumn(label: Text(widget.thirdColumn)),
          DataColumn(label: Text(widget.fourthColumn)),
          DataColumn(label: Text(widget.fivethColumn)),
          DataColumn(label: Text(widget.sixthColumn), numeric: true),
        ],
        rows: [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(Text(widget.firstRow)),
            DataCell(Text(widget.secondRow)),
            DataCell(Text(widget.thirdRow)),
            DataCell(Text(widget.fourthRow)),
            DataCell(Text(widget.fivethRow)),
            DataCell(Text(widget.sixthRow)),
          ]),
        ],
        dividerThickness: 2,
        dataRowHeight: 70,
        dataTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        dataRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 220, 240, 255)),
        showBottomBorder: true,
        headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromRGBO(14, 61, 97, 1)),
      ),
    );
  }
}
