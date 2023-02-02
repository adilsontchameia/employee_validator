import 'package:flutter/material.dart';

class BuildTable extends StatefulWidget {
  const BuildTable({super.key});

  @override
  State<BuildTable> createState() => _BuildTableState();
}

class _BuildTableState extends State<BuildTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        // Datatable widget that have the property columns and rows.
        columns: const [
          // Set the name of the column
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('LastName'),
          ),
          DataColumn(
            label: Text('Age'),
          ),
        ],
        rows: const [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(Text("1")),
            DataCell(Text("Alex")),
            DataCell(Text("Anderson")),
            DataCell(Text("18")),
          ]),
          DataRow(cells: [
            DataCell(Text("2")),
            DataCell(Text("John")),
            DataCell(Text("Anderson")),
            DataCell(Text("24")),
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
