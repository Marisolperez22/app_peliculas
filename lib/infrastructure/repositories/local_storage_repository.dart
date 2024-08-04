import '../../domain/datasources/local_storage_datasource.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }
}
