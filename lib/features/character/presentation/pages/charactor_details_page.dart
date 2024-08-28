import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_app_marvels/core/extensions/theme_extension.dart';
import 'package:test_app_marvels/core/utils/constants.dart';
import 'package:test_app_marvels/core/utils/utils.dart';
import 'package:test_app_marvels/features/character/data/models/charactor_model.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterModel charactor;

  const CharacterDetailsPage({
    super.key,
    required this.charactor,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(charactor.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: charactor.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              height: 250,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    charactor.description.isEmpty
                        ? 'No description available'
                        : charactor.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Stories:',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  charactor.stories.items.isEmpty
                      ? const Text('No stories')
                      : SizedBox(
                          height: 100,
                          width: context.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: charactor.stories.items.length,
                            itemBuilder: (context, index) {
                              final story = charactor.stories.items[index];
                              return StoriesWidgets(
                                  name: story.name, link: story.resourceURI);
                            },
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text(
                    'Events:',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  charactor.events.items.isEmpty
                      ? const Text('No events')
                      : SizedBox(
                          height: 100,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: charactor.events.items.length,
                            itemBuilder: (context, index) {
                              final event = charactor.events.items[index];
                              return StoriesWidgets(
                                name: event.name,
                                link: event.resourceURI,
                              );
                            },
                          ),
                        ),
                  const SizedBox(height: 16),
                  Text('Series:',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  charactor.series.items.isEmpty
                      ? const Text('No series')
                      : SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: charactor.series.items.length,
                            itemBuilder: (context, index) {
                              final series = charactor.series.items[index];
                              return StoriesWidgets(
                                name: series.name,
                                link: series.resourceURI,
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoriesWidgets extends StatelessWidget {
  const StoriesWidgets({
    super.key,
    required this.name,
    required this.link,
  });

  final String name;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.launchURL(link);
      },
      child: Container(
        width: 200,
        height: 100,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kLightestGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 16),
            ),
            const Spacer(),
            const Icon(
              Icons.link_sharp,
              color: kBlack,
            ),
          ],
        ),
      ),
    );
  }
}
