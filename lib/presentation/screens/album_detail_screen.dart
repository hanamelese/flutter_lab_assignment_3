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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurpleAccent, Colors.white], // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  album.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...photos.map(
                  (photoModel) => Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photoModel.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        photoModel.url,
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../../domain/entities/album.dart';
// import '../../data/models/photo_model.dart';
//
// class AlbumDetailScreen extends StatelessWidget {
//   final Album album;
//   final List<PhotoModel> photos;
//
//   const AlbumDetailScreen({
//     Key? key,
//     required this.album,
//     required this.photos,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Album ${album.id} Details')),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.deepPurpleAccent, Colors.white], // Background gradient
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView(
//           padding: const EdgeInsets.all(16.0),
//           children: [
//             Card(
//               elevation: 6,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   album.title,
//                   style: Theme.of(context).textTheme.titleLarge,
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ...photos.map(
//                   (photoModel) => Card(
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 elevation: 4,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 child: ListTile(
//                   contentPadding: const EdgeInsets.all(12),
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.network(photoModel.thumbnailUrl, width: 50, height: 50, fit: BoxFit.cover),
//                   ),
//                   title: Text(photoModel.title),
//                   trailing: const Icon(Icons.photo_library, color: Colors.deepPurpleAccent),
//                 ),
//               ),
//             ).toList(),
//           ],
//         ),
//       ),
//     );
//   }
// }