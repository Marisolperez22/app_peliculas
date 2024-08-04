import '../entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
