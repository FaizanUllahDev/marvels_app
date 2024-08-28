// features/character/domain/usecases/get_characters.dart
import 'package:test_app_marvels/core/usecases/usecases.dart';
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';

import '../repositories/character_repository.dart';

class GetCharacters implements UseCase<CharacterDataWrapper, RequestParam> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<CharacterDataWrapper> call(RequestParam param) async {
    return await repository.getCharacters(param);
  }
}
