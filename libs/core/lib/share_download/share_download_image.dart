import 'dart:typed_data';
import 'package:core/native_document_directory/native_document_directory.dart';
import 'package:core/share_download/share_file_manager.dart';
import 'package:flutter/src/rendering/proxy_box.dart';
import 'dart:ui' as ui;

abstract class ShareDownloadManger {
  Future<bool> shareImage(RenderRepaintBoundary? boundary);

  Future<bool> downloadImage(RenderRepaintBoundary? boundary);
}

class ShareDownloadMangerImpl implements ShareDownloadManger {
  final NativeDocumentDirectory _nativeDocumentDirectory;
  final ShareFileManager _shareFileManager;

  ShareDownloadMangerImpl(
    this._nativeDocumentDirectory,
    this._shareFileManager,
  );

  @override
  Future<bool> downloadImage(RenderRepaintBoundary? boundary) async {
    bool result = false;

    await _prepareImage(boundary).then((image) async {
      if (image != null) {
        String? directory =
            await _nativeDocumentDirectory.getDocumentsDirectory();

        await _nativeDocumentDirectory.saveFile(
          '${directory}/image.png',
          image,
        );

        result = true;
      }
    });
    return result;
  }

  @override
  Future<bool> shareImage(RenderRepaintBoundary? boundary) async {
    bool result = false;

    await _prepareImage(boundary).then((image) async {
      if (image != null) {
        String? directory =
            await _nativeDocumentDirectory.getDocumentsDirectory();

        String path = await _nativeDocumentDirectory.saveFile(
            '${directory}/image.png', image);

        await _shareFileManager.shareFiles([path]);
        result = true;
      }
    });
    return result;
  }

  Future<Uint8List?> _prepareImage(RenderRepaintBoundary? boundary) async {
    Uint8List? imageResult;
    if (boundary != null) {
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (byteData != null) {
        imageResult = byteData.buffer.asUint8List();
      }
    }

    return imageResult;
  }
}
