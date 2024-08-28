part of 'character_cubit.dart';

class CharacterState extends Equatable {
  final CharacterDataWrapper charactersWrap;
  final int offset;
  final String message;
  final StatusEnum status;

  const CharacterState({
    required this.charactersWrap,
    required this.offset,
    required this.message,
    required this.status,
  });

  // init state
  factory CharacterState.initial() {
    return const CharacterState(
      charactersWrap: CharacterDataWrapper(
        code: 0,
        status: '',
        data: null,
      ),
      offset: 0,
      message: '',
      status: StatusEnum.init,
    );
  }

  CharacterState copyWith({
    CharacterDataWrapper? charactersWrap,
    int? offset,
    String? message,
    StatusEnum? status,
  }) {
    return CharacterState(
      charactersWrap: charactersWrap ?? this.charactersWrap,
      offset: offset ?? this.offset,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        charactersWrap,
        offset,
        message,
        status,
      ];
}
