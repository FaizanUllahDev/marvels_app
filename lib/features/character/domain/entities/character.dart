// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:test_app_marvels/features/character/data/models/charactor_model.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String description;
  final DateTime modified;
  final String resourceURI;
  final List<Url> urls;
  final Image thumbnail;
  final ComicList comics;
  final StoryList stories;
  final EventList events;
  final SeriesList series;

  String get imageUrl => '${thumbnail.path}.${thumbnail.extension}';

  const Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceURI,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        resourceURI,
        urls,
        thumbnail,
        comics,
        stories,
        events,
        series,
      ];
}
