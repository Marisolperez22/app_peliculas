import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/entities.dart';
import '../../delegates/search_movie_delegate.dart';
import '../../providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SizedBox(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              final searchedMovies = ref.read(searchedMoviesProvider);
              final searchQuery = ref.read(searchQueryProvider);

              showSearch<Movie?>(
                      query: searchQuery,
                      context: context,
                      delegate: SearchMovieDelegate(
                          initialMovies: searchedMovies,
                          searchMovies: ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery))
                  .then((movie) {
                if (movie == null) return;
              });
            },
            child: Container(
              height: size.height * 0.05,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey.shade300),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
