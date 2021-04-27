import 'package:flutter/material.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class CardArticles extends StatefulWidget {
  @override
  _CardArticlesState createState() => _CardArticlesState();
}

class _CardArticlesState extends State<CardArticles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: BorderRadius.circular(24)),
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
                      IconSvg(IconsSvg.calendar,
                          height: 90, width: 90, color: cWhite),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: (MediaQuery.of(context).size.width - 194),
                              child: Text(S.of(context).articles_head,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context).textTheme.headline3),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width - 194),
                              child: Text(S.of(context).articles_body,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context).textTheme.subtitle1),
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
    );
  }
}
