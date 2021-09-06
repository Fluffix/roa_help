import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Articles/ArticlesSerialise.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CardArticles extends StatefulWidget {
  const CardArticles({Key key, @required this.article}) : super(key: key);

  final Article article;
  @override
  _CardArticlesState createState() => _CardArticlesState();
}

class _CardArticlesState extends State<CardArticles> {
  // WebViewController _controller;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // _controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.article.link != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => SafeArea(
                        child: SwipeDetector(
                          onSwipeRight: () {
                            Navigator.pop(context);
                          },
                          child: WebView(
                            initialUrl: widget.article.link,
                            gestureRecognizers: Set()
                              ..add(Factory<VerticalDragGestureRecognizer>(
                                  () => VerticalDragGestureRecognizer())),
                          ),
                        ),
                      )));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: Theme.of(context).brightness != Brightness.dark
                  ? Style.shadowCard
                  : null),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.article.thumbnail,
                    height: 90, width: 90, color: Style.white),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 194,
                        child: Text(widget.article.header,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline3),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 194,
                        child: Text(widget.article.summary,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: Theme.of(context).textTheme.subtitle1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
