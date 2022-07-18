import 'dart:typed_data';

import 'package:core/native_document_directory/native_document_directory.dart';
import 'package:core/share_download/share_download_image.dart';
import 'package:core/share_download/share_file_manager.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'dart:ui';

class MockNativeDocumentDirectory extends Mock
    implements NativeDocumentDirectory {}

class MockShareFileManager extends Mock implements ShareFileManager {}

class MockRenderRepaintBoundary extends Mock implements RenderRepaintBoundary {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    super.toString();
    return 'mock';
  }
}

class MockImage extends Mock implements Image {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    super.toString();
    return 'mock';
  }
}

void main() {
  late ShareDownloadMangerImpl shareDownloadManger;
  late NativeDocumentDirectory nativeDocumentDirectory;
  late ShareFileManager shareFileManager;
  late RenderRepaintBoundary renderRepaintBoundary;
  late Image image;

  setUpAll(() {
    registerFallbackValue(ImageByteFormat.png);
    registerFallbackValue(Uint8List(2));
  });

  setUp(() {
    image = MockImage();
    renderRepaintBoundary = MockRenderRepaintBoundary();
    nativeDocumentDirectory = MockNativeDocumentDirectory();
    shareFileManager = MockShareFileManager();

    when(() => renderRepaintBoundary.toImage()).thenAnswer((_) async => image);
    when(() => image.toByteData(format: any(named: 'format')))
        .thenAnswer((_) async => ByteData(8));
    when(() => nativeDocumentDirectory.getDocumentsDirectory())
        .thenAnswer((_) async => '/test');
    when(() => nativeDocumentDirectory.saveFile(any(), any()))
        .thenAnswer((_) async => 'path');
    when(() => shareFileManager.shareFiles(any()))
        .thenAnswer((_) async => null);

    shareDownloadManger = ShareDownloadMangerImpl(
      nativeDocumentDirectory,
      shareFileManager,
    );
  });

  group('validate share and download image. ', () {
    test('should return true if download the image', () async {
      // Act
      final result =
          await shareDownloadManger.downloadImage(renderRepaintBoundary);
      // Assert
      expect(result, true);
    });

    test('should return true if image is shared', () async {
      // Act
      final result =
          await shareDownloadManger.shareImage(renderRepaintBoundary);
      // Assert
      expect(result, true);
    });
  });
}
