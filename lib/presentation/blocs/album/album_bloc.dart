// lib/presentation/blocs/album/album_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_lab_assignment_3/domain/entities/album.dart';
import 'package:flutter_lab_assignment_3/domain/entities/photo.dart';
import 'package:flutter_lab_assignment_3/data/repositories/album_repository.dart';
import 'package:flutter_lab_assignment_3/data/models/album_model.dart';
import 'package:flutter_lab_assignment_3/data/models/photo_model.dart';

import 'album_event.dart';
import 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;

  AlbumBloc(this.repository) : super(AlbumInitial()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        List<AlbumModel> albums = await repository.getAlbums();
        List<PhotoModel> photos = await repository.getPhotos();
        emit(AlbumLoaded(albums: albums, photos: photos));
      } catch (e) {
        emit(AlbumError(message: e.toString()));
      }
    });
  }
}
