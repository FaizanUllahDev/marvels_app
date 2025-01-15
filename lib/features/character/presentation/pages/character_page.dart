// features/character/presentation/pages/character_page.dart
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_marvels/core/enum/status_enum.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/features/character/domain/entities/request_param.dart';
import 'package:test_app_marvels/features/character/presentation/cubit/character_cubit.dart';
import 'package:test_app_marvels/features/character/presentation/widgets/character_list_item.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  CharacterCubit get characterCubit => context.read<CharacterCubit>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      characterCubit.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) => _buildCharacterList(state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: characterCubit.requestParam.orderBy.orderBy,
            decoration: const InputDecoration(
              labelText: 'Order By',
            ),
            items: OrderByEnum.values
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e.orderBy,
                    child: Text(e.name.toCapAndSpace()),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              characterCubit.requestParam =
                  characterCubit.requestParam.copyWith(
                orderBy: OrderByEnumExtension.fromString(value),
              );
              characterCubit.fetchCharacters();
            },
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search character',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (str) {
              EasyDebounce.cancel('search');
              EasyDebounce.debounce(
                'search',
                const Duration(milliseconds: 500),
                () => characterCubit.search(str),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterList(CharacterState state) {
    final length = state.charactersWrap.data?.results.length ?? 0;

    Utils.debug('CharacterCubit length: $length');
    Utils.debug('state state: $state');

    if (state.status == StatusEnum.loading && length == 0) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (state.status == StatusEnum.error && length == 0) {
      return Center(
        child: Text(state.message),
      );
    }

    if (length == 0) {
      return const Center(
        child: Text('No data found'),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: length + 1,
      itemBuilder: (context, index) {
        if (index == length) {
          if (state.status == StatusEnum.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (length == state.charactersWrap.data?.total) {
            return const SizedBox.shrink();
          }
        }

        final character =
            state.charactersWrap.data?.results.elementAtOrNull(index);
        if (character == null) {
          return const SizedBox.shrink();
        }
        return CharacterListItem(character: character);
      },
    );
  }
}
