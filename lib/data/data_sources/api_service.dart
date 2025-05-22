// lib/data/data_sources/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;


import '../models/album_model.dart';
import '../models/photo_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client client;

  ApiService(this.client);

  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await client.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => AlbumModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await client.get(Uri.parse('$baseUrl/photos'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => PhotoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
