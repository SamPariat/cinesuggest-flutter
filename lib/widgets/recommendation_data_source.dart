import 'package:cinesuggest/models/models.dart';
import 'package:flutter/material.dart';

class RecommendationDataSource extends DataTableSource {
  final List<MovieIdAndTitle> allMovies;

  RecommendationDataSource({
    required this.allMovies,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= allMovies.length) return null;

    final item = allMovies[index];

    return DataRow(
      cells: <DataCell>[
        DataCell(
          Text(
            item.id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        DataCell(
          Text(
            item.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => allMovies.length;

  @override
  int get selectedRowCount => 0;
}
