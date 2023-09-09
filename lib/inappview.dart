import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatefulWidget {
  const InAppWebViewPage({super.key});

  @override
  State<InAppWebViewPage> createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  @override
  Widget build(BuildContext context) {
    final String urlPath = 'https://github.com/maqamylee0';
    late InAppWebViewController inAppWebViewController;
    double _progress = 0;

    return  WillPopScope(
      onWillPop: ()async{
        var lastPage = inAppWebViewController.canGoBack();
        if(await lastPage){
          inAppWebViewController.goBack();
          return false;
        }
        return true;

      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Slack Profile"),
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(urlPath)),
              onWebViewCreated: (InAppWebViewController controller){
                inAppWebViewController = controller;
              },
              onProgressChanged: (InAppWebViewController controller, int progress){
                setState(() {
                  _progress = progress as double;
                });
              },
            ),
            _progress  < 1 ? Container(
              child: LinearProgressIndicator(
                value: _progress,
              ),
            ): SizedBox()

          ],
        ),

      ),
    );
  }
}
