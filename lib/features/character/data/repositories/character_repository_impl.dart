// features/character/data/repositories/character_repository_impl.dart
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';

import '../../domain/repositories/character_repository.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<CharacterDataWrapper> getCharacters(RequestParam param) async {
    return await remoteDataSource.getAllCharacters(param);
  }
}
