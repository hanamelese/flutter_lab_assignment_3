import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/blocs/album/album_bloc.dart';
import 'package:flutter_lab_assignment_3/presentation/blocs/album/album_event.dart';
import 'package:flutter_lab_assignment_3/presentation/blocs/album/album_state.dart';

import '../../navigation/app_router.dart';
import '../../data/models/photo_model.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AlbumBloc>().add(LoadAlbums());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      album.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      AppRouter.goToAlbumDetails(
                        context,
                        album: album,
                        photos: state.photos
                            .where((p) => p.albumId == album.id)
                            .map((p) => PhotoModel(
                          albumId: p.albumId,
                          id: p.id,
                          title: p.title,
                          url: p.url,
                          thumbnailUrl: p.thumbnailUrl,
                        ))
                            .toList(),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}