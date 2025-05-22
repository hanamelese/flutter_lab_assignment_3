// lib/presentation/blocs/album/album_state.dart
import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';


abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  final List<Photo> photos;

  AlbumLoaded({required this.albums, required this.photos});
}

class AlbumError extends AlbumState {
  final String message;

  AlbumError({required this.message});
}
