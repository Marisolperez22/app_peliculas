import 'package:app_peliculas/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(topRatedMoviesProvider).isEmpty;

  if (step1 || step2) return true;

  return false; // terminamos de cargar
});
