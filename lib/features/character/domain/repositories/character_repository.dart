// features/character/domain/repositories/character_repository.dart
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';

abstract class CharacterRepository {
  Future<CharacterDataWrapper> getCharacters(RequestParam param);
}
