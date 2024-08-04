import '../entities/movie.dart';

abstract class LocalStorageRepository {
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
