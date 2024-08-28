import 'dart:convert';

import 'package:test_app_marvels/features/character/data/models/charactor_model.dart';

class CharacterDataWrapper {
  final int code;
  final String status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final CharacterDataContainer? data;
  final String? etag;

  const CharacterDataWrapper({
    required this.code,
    required this.status,
    this.copyright,
    this.attributionText,
    this.attributionHTML,
    this.data,
    this.etag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHTML,
      'data': data?.toMap(),
      'etag': etag,
    };
  }

  factory CharacterDataWrapper.fromMap(Map<String, dynamic> map) {
    return CharacterDataWrapper(
      code: map['code'] as int,
      status: map['status'] as String,
      copyright: map['copyright'] != null ? map['copyright'] as String : null,
      attributionText: map['attributionText'] != null
          ? map['attributionText'] as String
          : null,
      attributionHTML: map['attributionHTML'] != null
          ? map['attributionHTML'] as String
          : null,
      data: map['data'] != null
          ? CharacterDataContainer.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      etag: map['etag'] != null ? map['etag'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDataWrapper.fromJson(String source) =>
      CharacterDataWrapper.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CharacterDataContainer {
  final int offset;
  final int limit;
  final int total;
  final int count;
   List<CharacterModel> results;

  CharacterDataContainer({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory CharacterDataContainer.fromMap(Map<String, dynamic> map) {
    return CharacterDataContainer(
      offset: map['offset'] as int,
      limit: map['limit'] as int,
      total: map['total'] as int,
      count: map['count'] as int,
      results: List<CharacterModel>.from(
        (map['results'] as List).map<CharacterModel>(
          (x) => CharacterModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDataContainer.fromJson(String source) =>
      CharacterDataContainer.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
