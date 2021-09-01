import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Articles/ArticlesSerialise.dart';
import 'package:roa_help/Utils/Style/Style.dart';

class CardArticles extends StatefulWidget {
  const CardArticles({Key key, this.article}) : super(key: key);

  final Article article;
  @override
  _CardArticlesState createState() => _CardArticlesState();
}

class _CardArticlesState extends State<CardArticles> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.article.link != null) {
          // Переход на статью
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: Theme.of(context).brightness != Brightness.dark
                      ? Style.shadowCard
                      : null),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   height: 90,
                        //   width: 90,
                        // ),
                        Image.network(widget.article.thumbnail,
                            height: 90, width: 90, color: Style.white),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 194),
                                child: Text(widget.article.header,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 194),
                                child: Text(widget.article.summary,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
