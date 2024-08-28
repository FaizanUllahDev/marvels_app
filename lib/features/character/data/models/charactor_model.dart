// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app_marvels/features/character/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.description,
    required super.modified,
    required super.resourceURI,
    required super.urls,
    required super.thumbnail,
    required super.comics,
    required super.stories,
    required super.events,
    required super.series,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'modified': modified.millisecondsSinceEpoch,
      'resourceURI': resourceURI,
      'urls': urls.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail.toMap(),
      'comics': comics.toMap(),
      'stories': stories.toMap(),
      'events': events.toMap(),
      'series': series.toMap(),
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      modified: DateTime.parse(map['modified']),
      resourceURI: map['resourceURI'] as String,
      urls: List<Url>.from(
        (map['urls'] as List).map<Url>(
          (x) => Url.fromJson(x as Map<String, dynamic>),
        ),
      ),
      thumbnail: Image.fromMap(map['thumbnail'] as Map<String, dynamic>),
      comics: ComicList.fromJson(map['comics'] as Map<String, dynamic>),
      stories: StoryList.fromJson(map['stories'] as Map<String, dynamic>),
      events: EventList.fromJson(map['events'] as Map<String, dynamic>),
      series: SeriesList.fromJson(map['series'] as Map<String, dynamic>),
    );
  }
}

class Url {
  Url({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      type: json['type'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'url': url,
    };
  }
}

class Image {
  Image({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'extension': extension,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      path: map['path'] as String,
      extension: map['extension'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) =>
      Image.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ComicList {
  ComicList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<ComicSummary> items;

  factory ComicList.fromJson(Map<String, dynamic> json) {
    return ComicList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: List<ComicSummary>.from(
          json['items'].map((x) => ComicSummary.fromJson(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }
}

class ComicSummary {
  ComicSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory ComicSummary.fromJson(Map<String, dynamic> json) {
    return ComicSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}

class StoryList {
  StoryList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<StorySummary> items;

  factory StoryList.fromJson(Map<String, dynamic> json) {
    return StoryList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: List<StorySummary>.from(
          json['items'].map((x) => StorySummary.fromJson(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }
}

class StorySummary {
  StorySummary({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  final String resourceURI;
  final String name;
  final String type;

  factory StorySummary.fromJson(Map<String, dynamic> json) {
    return StorySummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resourceURI': resourceURI,
      'name': name,
      'type': type,
    };
  }
}

class EventList {
  EventList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<EventSummary> items;

  factory EventList.fromJson(Map<String, dynamic> json) {
    return EventList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: List<EventSummary>.from(
          json['items'].map((x) => EventSummary.fromJson(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }
}

class EventSummary {
  EventSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory EventSummary.fromJson(Map<String, dynamic> json) {
    return EventSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}

class SeriesList {
  SeriesList({
    required this.available,
    required this.returned,
    required this.collectionURI,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionURI;
  final List<SeriesSummary> items;

  factory SeriesList.fromJson(Map<String, dynamic> json) {
    return SeriesList(
      available: json['available'],
      returned: json['returned'],
      collectionURI: json['collectionURI'],
      items: List<SeriesSummary>.from(
          json['items'].map((x) => SeriesSummary.fromJson(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'returned': returned,
      'collectionURI': collectionURI,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }
}

class SeriesSummary {
  SeriesSummary({
    required this.resourceURI,
    required this.name,
  });

  final String resourceURI;
  final String name;

  factory SeriesSummary.fromJson(Map<String, dynamic> json) {
    return SeriesSummary(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resourceURI': resourceURI,
      'name': name,
    };
  }
}
