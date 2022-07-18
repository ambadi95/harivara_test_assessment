import 'dart:io';

abstract class PlatformRetriever {
  bool get isIos;
}

class PlatformRetrieverImpl implements PlatformRetriever {
  @override
  bool get isIos => Platform.isIOS;
}
