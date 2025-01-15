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
    return {
      'offset': offset,
      'limit': limit,
      if (nameStartsWith.isNotEmpty) 'nameStartsWith': nameStartsWith,
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

// OrderByEnum for specifying sort order
enum OrderByEnum {
  name,
  modified,
  descendingName,
  descendingModified,
}

extension OrderByEnumExtension on OrderByEnum {
  static const List<String> _orderByStrings = [
    'name',
    'modified',
    '-name',
    '-modified',
  ];

  // Converts enum to string representation
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
    }
  }

  // Converts string to enum
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
        throw ArgumentError('Invalid orderBy value: $value');
    }
  }

  // Provides a list of valid orderBy strings
  static List<String> get list => _orderByStrings;
}
