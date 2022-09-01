import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/webview/webview.dart';

class ReadingInAppBrowser extends StatelessWidget {
  const ReadingInAppBrowser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebViewPage(
          title: TextUIDataModel('Y9 Books'),
          launchType: LaunchType.Network,
          url: 'https://read.worldreader.org/p/code/y9y9',
          leadingActionIcon:  Icon(Icons.arrow_back),
        )
      ),
    );
  }
}
