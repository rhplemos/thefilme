import 'package:flutter/material.dart';
import 'package:thefilme/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(movie.title),
      ),
    );
  }
}
