import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Donate extends StatefulWidget {



  @override
_WebviewState createState() => _WebviewState();
  
}

class _WebviewState extends State<Donate>{
 
  

  bool isLoading=true;
 

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:<Widget>[
        WebView(initialUrl: 'https://www.pinkhope.org.au/donate',javascriptMode: JavascriptMode.unrestricted,
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