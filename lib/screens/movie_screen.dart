import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  static const routeName = '/movie';

  final int movieId;
  final String movieTitle;

  const MovieScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movieTitle)),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getIt<MovieAbstract>().getInfo(movieId),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Text(
                'Network error. Kindly check your network connection.',
                style: TextStyle(
                  color: Colors.white,
                ),
              );
            }
            return MovieCard(movieInfo: snapshot.data!);
          },
        ),
      ),
    );
  }
}
