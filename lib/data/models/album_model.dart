// lib/data/models/album_model.dart

import '../../domain/entities/album.dart';

class AlbumModel extends Album {
  AlbumModel({
    required int userId,
    required int id,
    required String title,
  }) : super(userId: userId, id: id, title: title);

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }
}
