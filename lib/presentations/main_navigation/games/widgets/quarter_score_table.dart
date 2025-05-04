import 'package:flutter/material.dart';

class QuarterScoreTable extends StatelessWidget {
  const QuarterScoreTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(6),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
          4: FlexColumnWidth(1),
          5: FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          _buildRow(["Team", "1", "2", "3", "4", "T"], bold: true),
          _buildRow(["Los Angeles Lakers", "32", "33", "29", "31", "125"]),
          _buildRow(["San Antonio Spurs", "22", "29", "24", "34", "109"]),
        ],
      ),
    );
  }

  TableRow _buildRow(List<String> cells, {bool bold = false}) {
    return TableRow(
      children: List.generate(
        cells.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Align(
            alignment: index == 0 ? Alignment.centerLeft : Alignment.center,
            child: Text(
              cells[index],
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
