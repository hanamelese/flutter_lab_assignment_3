// lib/presentation/widgets/album_tile.dart

import 'package:flutter/material.dart';
import '../../domain/entities/album.dart';
import '../../domain/entities/photo.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final Photo? thumbnail;
  final VoidCallback onTap;

  const AlbumTile({
    Key? key,
    required this.album,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: thumbnail != null
          ? Image.network(thumbnail!.thumbnailUrl, width: 50, height: 50)
          : const Icon(Icons.image),
      title: Text(album.title),
      subtitle: Text('Album ID: ${album.id}'),
      onTap: onTap,
    );
  }
}
