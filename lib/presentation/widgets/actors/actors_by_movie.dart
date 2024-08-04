import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';

import '../../providers/providers.dart';

class ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const ActorsByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider);
    final size = MediaQuery.of(context).size;

    //* Loading actors
    if (actorsByMovie[movieId] == null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 50),
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: size.height * 0.17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];

          final parts = actor.name.split(' ');
          final firstName = parts.isNotEmpty ? parts.first : '';
          final lastName = parts.length > 1 ? parts.skip(1).join(' ') : '';

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: size.width * 0.28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Actor Photo
                FadeInRight(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage(
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('assets/loaders/loader.gif'),
                        image: NetworkImage(
                          actor.profilePath,
                        ),
                      )),
                ),

                // Nombre
                const SizedBox(
                  height: 5,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      firstName,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF666E78),
                      ),
                    ),
                    Text(
                      lastName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF666E78),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
