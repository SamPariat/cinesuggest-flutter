import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/models/models.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:flutter/material.dart';

class RecommendationDataSource extends DataTableSource {
  final List<AllMoviesInfo> allMovies;
  final BuildContext context;

  RecommendationDataSource({
    required this.allMovies,
    required this.context,
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
            style: tableCellStyle,
          ),
        ),
        DataCell(
          Text(
            item.title,
            style: tableCellStyle,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieScreen(
                  movieId: item.id,
                  movieTitle: item.title,
                ),
              ),
            );
          },
        ),
        DataCell(
          Text(
            item.genres.join(', '),
            style: tableCellStyle,
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
