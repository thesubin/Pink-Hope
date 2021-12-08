import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(initialUrl: 'https://www.pinkhope.org.au/donate',javascriptMode: JavascriptMode.unrestricted,),
    );
  }
}
