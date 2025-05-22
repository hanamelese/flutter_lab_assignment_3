import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../domain/entities/album.dart';
import '../data/models/photo_model.dart';
import '../presentation/screens/album_list_screen.dart';
import '../presentation/screens/album_detail_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AlbumListScreen(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final albumData = state.extra as Map<String, dynamic>;
          return AlbumDetailScreen(
            album: albumData['album'] as Album,
            photos: albumData['photos'] as List<PhotoModel>, // Ensure consistency
          );
        },
      ),
    ],
  );

  static void goToAlbumDetails(BuildContext context,
      {required Album album, required List<PhotoModel> photos}) { // Expect PhotoModel
    context.push('/details', extra: {'album': album, 'photos': photos});
  }
}