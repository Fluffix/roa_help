import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/models/ArticlesModel.dart';

class CardArticles extends StatefulWidget {
  const CardArticles({Key key, this.item}) : super(key: key);

  final AriclesItem item;
  @override
  _CardArticlesState createState() => _CardArticlesState();
}

class _CardArticlesState extends State<CardArticles> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.item.onTap != null) {
          widget.item.onTap();
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
                  boxShadow: AdaptiveTheme.of(context).theme !=
                          AdaptiveTheme.of(context).darkTheme
                      ? shadow
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
                        IconSvg(widget.item.icon,
                            height: 90, width: 90, color: cWhite),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width - 194),
                                child: Text(widget.item.title,
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
                                child: Text(widget.item.body,
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
