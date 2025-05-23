import 'package:flutter/material.dart';
import '../../domain/entities/album.dart';
import '../../data/models/photo_model.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Album album;
  final List<PhotoModel> photos;

  const AlbumDetailScreen({
    Key? key,
    required this.album,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album ${album.id} Details')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 8,
            surfaceTintColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Album Name:",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    album.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...photos.map(
                (photoModel) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                title: Text(photoModel.title),
                subtitle: SelectableText(
                  photoModel.url,
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
                trailing: const Icon(Icons.link, color: Colors.deepPurpleAccent),
              ),
            ),
          ).toList(),
        ],
      ),
    );
  }
}