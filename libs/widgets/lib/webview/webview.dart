import 'dart:convert';
import 'dart:io';

import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

enum LaunchType {
  Static,
  Network,
}

enum HandlerType {
  onPageStart,
  onPageFinish,
  onProgress,
  onWebViewCreated,
}

class WebViewPage extends StatefulWidget {
  static const viewPath = 'webView';
  final TextUIDataModel title;
  final String? url;
  final String? body;
  final Function({HandlerType? handlerType, dynamic params})? handler;
  final LaunchType launchType;
  final Icon? leadingActionIcon;
  final Icon? trailingActionIcon;
  final Function? onActionClick;
  final Color? backgroundColor;
  final bool closeOnCompletion;

  const WebViewPage({
    Key? key,
    required this.title,
    this.url,
    this.body,
    this.handler,
    required this.launchType,
    this.leadingActionIcon,
    this.trailingActionIcon,
    this.onActionClick,
    this.backgroundColor,
    this.closeOnCompletion = false,
  }) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

  Future _loadOutputFromStaticFileUrl(
    WebViewController controller,
    String url,
  ) async {
    final dataInFile = await rootBundle.loadString(url);
    final contentBase64 = base64Encode(const Utf8Encoder().convert(dataInFile));
    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  void _loadOutput(WebViewController controller) {
    switch (widget.launchType) {
      case LaunchType.Static:
        if (widget.url.isNullOrEmpty()) {
          final contentBase64 =
              base64Encode(const Utf8Encoder().convert(widget.body!));
          controller.loadUrl('data:text/html;base64,$contentBase64');
        } else {
          _loadOutputFromStaticFileUrl(controller, widget.url!);
        }

        break;

      case LaunchType.Network:
        controller.loadUrl(widget.url!);
        break;

      default:
        throw UnimplementedError('Missing Launch Type');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

    return Scaffold(
      key: Key('WebView_Scaffold'),
      appBar: WebViewAppBar(),
      body: WebView(
        key: Key('WebView'),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller = webViewController;
          _loadOutput(controller);
          widget.handler?.call(handlerType: HandlerType.onWebViewCreated);
        },
        onProgress: (int progress) {
          widget.handler?.call(handlerType: HandlerType.onProgress);
        },
        javascriptChannels: <JavascriptChannel>{
          // _toasterJavascriptChannel(context),

          // define an internal functions for all these
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          widget.handler?.call(handlerType: HandlerType.onPageStart);
        },
        onPageFinished: (String url) {
          widget.handler?.call(handlerType: HandlerType.onPageFinish);
        },
        gestureNavigationEnabled: true,
      ),
    );
  }

  PreferredSizeWidget WebViewAppBar() {
    return AppBar(
      key: Key('PreferredSizeWidget_AppBar'),
      actions: widget.trailingActionIcon != null
          ? [
              IconButton(
                key: Key('PreferredSizeWidget_IconButton'),
                icon: widget.trailingActionIcon!,
                onPressed: () {
                  handleOnIconPress();
                },
              ),
            ]
          : null,
      leading: widget.leadingActionIcon != null
          ? IconButton(
              key: Key('PreferredSizeWidgetLeading_IconButton'),
              icon: widget.leadingActionIcon!,
              onPressed: () {
                handleOnIconPress();
              },
            )
          : Container(key: Key('PreferredSizeWidget_NullContainer')),
      elevation: 0,
      backgroundColor: widget.backgroundColor ?? Color(0xFFF7F7F4),
      centerTitle: true,
      title: CrayonPaymentText(
        text: TextUIDataModel(
          widget.title.text,
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
        ),
        key: Key('PreferredSizeWidget_titleText'),
      ),
    );
  }

  void handleOnIconPress() {
    if (widget.onActionClick != null) {
      widget.onActionClick!();
    } else {
      // TODO: refactor below
      DIContainer.container.resolve<NavigationManager>().goBack();
    }
  }
}
