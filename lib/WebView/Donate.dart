import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebSite extends StatefulWidget {
  const WebSite({
    @required this.url
  });



  final String url;
  @override
_WebviewState createState() => _WebviewState(url:url);
  
}

class _WebviewState extends State<WebSite>{
 
  _WebviewState({
    @required this.url
  });

  final String url;
  bool isLoading=true;
 

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
        WebView(initialUrl: url,javascriptMode: JavascriptMode.unrestricted,
       onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
       }
      ),
       isLoading ? Center( child: CircularProgressIndicator(),)
                    : Stack(),
    
    ]
    )
    );
  }
}