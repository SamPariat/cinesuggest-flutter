import 'package:cinesuggest/models/models.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecommendationTable extends StatefulWidget {
  final List<MovieIdAndTitle> allMovies;

  const RecommendationTable({
    super.key,
    required this.allMovies,
  });

  @override
  State<RecommendationTable> createState() => _RecommendationTableState();
}

class _RecommendationTableState extends State<RecommendationTable> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
          thickness: 0,
        ),
      ),
      child: PaginatedDataTable(
        horizontalMargin: MediaQuery.of(context).size.width * 0.1,
        arrowHeadColor: Colors.white,
        rowsPerPage: 10,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Id',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            numeric: true,
          ),
          DataColumn(
              label: Text(
            'Title',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )),
        ],
        source: RecommendationDataSource(
          allMovies: widget.allMovies,
        ),
      ),
    );
  }
}
