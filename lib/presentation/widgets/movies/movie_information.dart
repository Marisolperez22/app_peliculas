import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class Information extends StatelessWidget {
  final Movie movie;

  const Information({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Studio',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Flexible(
                  child: Text(
                movie.productionCompanies.join(', '),
                style: const TextStyle(
                  color: Color(0xFF666E78),
                  fontSize: 15,
                ),
                overflow: TextOverflow.visible,
              )),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Genre',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                movie.genreIds.join(', '),
                style: const TextStyle(
                  color: Color(0xFF666E78),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Release',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Text(
                movie.releaseDate.year.toString(),
                style: const TextStyle(
                  color: Color(0xFF666E78),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
