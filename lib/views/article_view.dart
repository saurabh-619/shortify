import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl;
  ArticleView({this.articleUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282B30),
        iconTheme: IconThemeData(color: Color(0xffFCBC35)),
        title: Text(
          'Shortify',
          style: TextStyle(
            color: Color(0xffFCBC35),
            fontSize: 23,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}
