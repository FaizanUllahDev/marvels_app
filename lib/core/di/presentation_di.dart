import 'package:test_app_marvels/core/di/di_server.dart';
import 'package:test_app_marvels/features/character/domain/repositories/character_repository.dart';
import 'package:test_app_marvels/features/character/domain/usecases/get_characters.dart';
import 'package:test_app_marvels/features/character/presentation/cubit/character_cubit.dart';

void presentationDI() {
  sl.registerLazySingleton<GetCharacters>(
    () => GetCharacters(sl<CharacterRepository>()),
  );

  sl.registerLazySingleton<CharacterCubit>(
    () => CharacterCubit(sl<GetCharacters>()),
  );
}
