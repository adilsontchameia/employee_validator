import 'package:flutter/material.dart';

import 'custom_table_widget.dart';

class QueryResultTable extends StatelessWidget {
  const QueryResultTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('QUERY RESULTS',
            style: TextStyle(
                fontSize: 35,
                color: Color.fromRGBO(14, 61, 97, 1),
                fontWeight: FontWeight.bold)),
        BuildTable(),
      ],
    );
  }
}
