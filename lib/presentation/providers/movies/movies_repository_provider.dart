// Este repositorio es inmutable
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasource/moviedb_datasource.dart';
import '../../../infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
