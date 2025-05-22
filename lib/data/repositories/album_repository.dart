// lib/data/repositories/album_repository.dart

import '../data_sources/api_service.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';

class AlbumRepository {
  final ApiService apiService;

  AlbumRepository(this.apiService);

  Future<List<AlbumModel>> getAlbums() => apiService.fetchAlbums();

  Future<List<PhotoModel>> getPhotos() => apiService.fetchPhotos();
}
