import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildDescription(),
                  const SizedBox(height: 16),
                  _buildSection(
                    context,
                    title: 'Stories:',
                    items: charactor.stories.items,
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    context,
                    title: 'Events:',
                    items: charactor.events.items,
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    context,
                    title: 'Series:',
                    items: charactor.series.items,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: charactor.imageUrl,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      height: 250,
      width: double.infinity,
    );
  }

  Widget _buildDescription() {
    return Text(
      charactor.description.isEmpty
          ? 'No description available'
          : charactor.description,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<dynamic> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        items.isEmpty
            ? const Text('No items available')
            : SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return StoriesWidgets(
                      name: item.name,
                      link: item.resourceURI,
                    );
                  },
                ),
              ),
      ],
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
      onTap: () => Utils.launchURL(link),
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
