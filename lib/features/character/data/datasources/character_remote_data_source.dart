import 'package:test_app_marvels/core/error/exceptions.dart';
import 'package:test_app_marvels/core/network/network_client.dart';
import 'package:test_app_marvels/core/network/network_constants.dart';
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';

abstract class CharacterRemoteDataSource {
  Future<CharacterDataWrapper> getAllCharacters(RequestParam param);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final NetworkClient client;

  CharacterRemoteDataSourceImpl(this.client);

  @override
  Future<CharacterDataWrapper> getAllCharacters(RequestParam param) async {
    try {
      final response = await client.invoke(
        NetworkConstants.kCharacters,
        RequestType.get,
        queryParameters: param.toMap(),
      );
      if (response.statusCode == 200) {
        return CharacterDataWrapper.fromMap(response.data);
      } else {
        throw GeneralException(message: response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
