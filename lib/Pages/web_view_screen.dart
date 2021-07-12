import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  var routsArgs;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    routsArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
  }

  @override
  Widget build(BuildContext context) {

    return WebView(
      initialUrl: routsArgs['link'],
    );
  }
}
