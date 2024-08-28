import 'package:test_app_marvels/core/di/di_server.dart';
import 'package:test_app_marvels/core/network/network_client.dart';
import 'package:test_app_marvels/features/character/data/datasources/character_remote_data_source.dart';
import 'package:test_app_marvels/features/character/data/repositories/character_repository_impl.dart';
import 'package:test_app_marvels/features/character/domain/repositories/character_repository.dart';

initRemoteDI() {
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(
      CharacterRemoteDataSourceImpl(
        sl<NetworkClient>(),
      ),
    ),
  );
}
