import 'package:flutter/material.dart';

import '../../../config/helpers/human_formats.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;

  const MovieRating({required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    double rating = (voteAverage / 2).clamp(0, 5);

    List<Widget> stars = [];

    for (int i = 1; i <= rating.floor(); i++) {
      stars.add(const Icon(Icons.star, color: Color.fromRGBO(203, 179, 59, 1)));
    }

    if (rating - rating.floor() > 0) {
      stars.add(
          const Icon(Icons.star_half, color: Color.fromRGBO(203, 179, 59, 1)));
    }

    while (stars.length < 5) {
      stars.add(const Icon(Icons.star, color: Color.fromRGBO(107, 98, 48, 1)));
    }

    return Row(children: stars);
  }
}

class MovieWidget extends StatelessWidget {
  final double voteAverage;

  const MovieWidget({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          HumanFormats.number(voteAverage, 1),
        ),
        MovieRating(voteAverage: voteAverage),
      ],
    );
  }
}
