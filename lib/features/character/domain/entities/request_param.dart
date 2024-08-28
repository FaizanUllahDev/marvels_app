// ignore_for_file: public_member_api_docs, sort_constructors_first

class RequestParam {
  final int offset;
  final int limit;
  final String nameStartsWith;
  final OrderByEnum orderBy;

  const RequestParam({
    this.offset = 0,
    this.limit = 20,
    this.nameStartsWith = '',
    this.orderBy = OrderByEnum.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'nameStartsWith': nameStartsWith,
      'orderBy': orderBy.orderBy,
    };
  }

  RequestParam copyWith({
    int? offset,
    int? limit,
    String? nameStartsWith,
    OrderByEnum? orderBy,
  }) {
    return RequestParam(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      nameStartsWith: nameStartsWith ?? this.nameStartsWith,
      orderBy: orderBy ?? this.orderBy,
    );
  }
}

//orderBy
enum OrderByEnum {
  name,
  modified,
  descendingName,
  descendingModified,
}

extension OrderByEnumExtension on OrderByEnum {
  // list
  static List<String> get list {
    return [
      'name',
      'modified',
      '-name',
      '-modified',
    ];
  }

  String get orderBy {
    switch (this) {
      case OrderByEnum.name:
        return 'name';
      case OrderByEnum.modified:
        return 'modified';
      case OrderByEnum.descendingName:
        return '-name';
      case OrderByEnum.descendingModified:
        return '-modified';
      default:
        return 'name';
    }
  }

  static OrderByEnum fromString(String? value) {
    switch (value) {
      case 'name':
        return OrderByEnum.name;
      case 'modified':
        return OrderByEnum.modified;
      case '-name':
        return OrderByEnum.descendingName;
      case '-modified':
        return OrderByEnum.descendingModified;
      default:
        return OrderByEnum.name;
    }
  }
}
