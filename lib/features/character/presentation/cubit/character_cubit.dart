import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_marvels/core/enum/status_enum.dart';
import 'package:test_app_marvels/core/error/exceptions.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';
import 'package:test_app_marvels/features/character/domain/repositories/character_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.repository) : super(CharacterState.initial());

  final CharacterRepository repository;

  final int itemsPerPage = 20;

  void loadNextPage() {
    getCharacters(loadMore: true);
  }

  RequestParam requestParam = const RequestParam();

  Future<void> getCharacters({bool loadMore = false}) async {
    if (state.status == StatusEnum.loading) return;
    if (!loadMore) {
      emit(state.copyWith(
        status: StatusEnum.loading,
        charactersWrap: null,
        message: '',
        offset: 0,
      ));
    }
    emit(state.copyWith(status: StatusEnum.loading));

    try {
      final offset = loadMore ? state.offset + itemsPerPage : 0;
      requestParam = requestParam.copyWith(offset: offset);
      final charactersWrap = await repository.getCharacters(
        requestParam,
      );
      Utils.debug(charactersWrap.data!.results.length.toString());
      final oldList = state.charactersWrap.data?.results ?? [];
      charactersWrap.data!.results = oldList + charactersWrap.data!.results;
      emit(state.copyWith(
        charactersWrap: charactersWrap,
        offset: offset,
        status: StatusEnum.loaded,
      ));
    } on GeneralException catch (e) {
      Utils.debug(e.message);
      emit(state.copyWith(
        message: e.message.toString(),
        status: StatusEnum.error,
      ));
    } on Exception catch (e) {
      Utils.debug(e.toString());
      emit(state.copyWith(
        message: e.toString(),
        status: StatusEnum.error,
      ));
    }
  }

  // search from list of characters
  void search(String query) {
    requestParam = requestParam.copyWith(nameStartsWith: query);
    getCharacters();
  }
}
