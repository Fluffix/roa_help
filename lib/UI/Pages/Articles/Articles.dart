import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Articles/Articles.dart';
import 'package:roa_help/Requests/Articles/ArticlesSerialise.dart';
import 'package:roa_help/UI/General/widgets/CustomAppBar.dart';
import 'package:roa_help/UI/Pages/Articles/widgets/CardArticles.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:shimmer/shimmer.dart';

class Articles extends StatefulWidget {
  const Articles({Key key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Article> _articles;
  bool _loading;

  @override
  void initState() {
    _loading = false;
    load();
    super.initState();
  }

  void load() async {
    setState(() {
      _loading = true;
    });
    _articles = await getArticles();
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: S.of(context).articles),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                _loading
                    ? Shimmer.fromColors(
                        baseColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Theme.of(context).cardColor
                            : Theme.of(context).disabledColor.withOpacity(0.25),
                        highlightColor: Theme.of(context).brightness ==
                                Brightness.dark
                            ? Theme.of(context).disabledColor.withOpacity(0.25)
                            : Theme.of(context).cardColor,
                        enabled: _loading,
                        child: Column(
                          children: List.generate(4, (index) {
                            return _buildLoading(
                                Theme.of(context).disabledColor);
                          }),
                        ))
                    : Column(
                        children: List.generate(
                            _articles.length,
                            (index) => CardArticles(
                                  article: _articles[index],
                                )),
                      ),
                SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _buildLoading(Color color) {
    return Padding(
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
                Container(
                  height: 90,
                  width: 90,
                  color: color,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 194,
                        height: 8,
                        color: color,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
