import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasource/isar_datasource.dart';
import '../../../infrastructure/repositories/local_storage_repository.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
