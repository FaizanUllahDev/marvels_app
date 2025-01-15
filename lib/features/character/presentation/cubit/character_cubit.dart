import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_marvels/core/enum/status_enum.dart';
import 'package:test_app_marvels/core/error/exceptions.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/features/character/data/models/character_data_wrapper.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';
import 'package:test_app_marvels/features/character/domain/usecases/get_characters.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this._getCharacters) : super(CharacterState.initial());

  final GetCharacters _getCharacters;
  final int itemsPerPage = 20;

  RequestParam requestParam = const RequestParam();

  /// Loads the next page of characters.
  void loadNextPage() {
    if (state.status != StatusEnum.loading) {
      fetchCharacters(loadMore: true);
    }
  }

  /// Fetches characters, either fresh or for the next page.
  Future<void> fetchCharacters({bool loadMore = false}) async {
    _emitLoadingState(loadMore);

    try {
      final offset = loadMore ? state.offset + itemsPerPage : 0;
      requestParam = requestParam.copyWith(offset: offset);
      final charactersWrap = await _getCharacters(requestParam);

      final updatedResults = _mergeOldAndNewResults(
        oldResults: state.charactersWrap.data?.results,
        newResults: charactersWrap.data?.results,
      );

      charactersWrap.data?.results = updatedResults;

      emit(state.copyWith(
        charactersWrap: charactersWrap,
        offset: offset,
        status: StatusEnum.loaded,
      ));
    } catch (e) {
      _emitErrorState(e);
    }
  }

  /// Handles search functionality for characters.
  void search(String query) {
    requestParam = requestParam.copyWith(nameStartsWith: query.toLowerCase());
    fetchCharacters();
  }

  /// Emits a loading state.
  void _emitLoadingState(bool loadMore) {
    if (loadMore) {
      emit(state.copyWith(status: StatusEnum.loading));
    } else {
      emit(state.copyWith(
        status: StatusEnum.loading,
        charactersWrap: const CharacterDataWrapper(
          code: 0,
          status: '',
          data: null,
        ),
        message: '',
        offset: 0,
      ));
    }
  }

  /// Emits an error state with the appropriate message.
  void _emitErrorState(dynamic error) {
    final errorMessage =
        error is GeneralException ? error.message : error.toString();
    Utils.debug(errorMessage);
    emit(state.copyWith(
      message: errorMessage,
      status: StatusEnum.error,
    ));
  }

  /// Merges old and new character results.
  List<T> _mergeOldAndNewResults<T>({
    List<T>? oldResults,
    List<T>? newResults,
  }) {
    return [...?oldResults, ...?newResults];
  }
}
