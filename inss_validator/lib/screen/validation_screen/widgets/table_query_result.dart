import 'package:flutter/material.dart';
import 'package:inss_validator/screen/validation_screen/widgets/custom_table_widget.dart';

class QueryResultAndTable extends StatelessWidget {
  const QueryResultAndTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
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
