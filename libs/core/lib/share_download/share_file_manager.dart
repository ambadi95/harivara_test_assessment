import 'package:share/share.dart';

abstract class ShareFileManager {
  Future<void> shareFiles(List<String> paths);
}

class ShareFileManagerImpl implements ShareFileManager {
  @override
  Future<void> shareFiles(List<String> paths) async {
    await Share.shareFiles(paths);
  }
}
