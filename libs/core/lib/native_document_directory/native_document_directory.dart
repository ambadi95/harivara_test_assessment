import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';

abstract class NativeDocumentDirectory {
  Future<String?> getDocumentsDirectory();

  Future<String> saveFile(String path, Uint8List image);
}

class NativeDocumentDirectoryImpl implements NativeDocumentDirectory {
  @override
  Future<String?> getDocumentsDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Future<String> saveFile(String path, Uint8List image) async {
    final imagePath = await File(path).create();
    await imagePath.writeAsBytes(image);
    await ImageGallerySaver.saveImage(
      image,
      quality: 60,
      name: 'file_name${DateTime.now()}',
    );
    return imagePath.path;
  }
}
