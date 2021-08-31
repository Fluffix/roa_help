import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Articles/Articles.dart';
import 'package:roa_help/Requests/Articles/ArticlesSerialise.dart';
import 'package:roa_help/UI/General/widgets/CustomAppBar.dart';
import 'package:roa_help/UI/Pages/Articles/widgets/CardArticles.dart';
import 'package:roa_help/generated/l10n.dart';

class Articles extends StatefulWidget {
  const Articles({Key key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Article> articles;
  bool loading;

  @override
  void initState() {
    loading = false;
    load();
    super.initState();
  }

  void load() async {
    setState(() {
      loading = true;
    });

    articles = await getArticles();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).sliderTheme.activeTrackColor,
              ),
            ),
          )
        : Material(
            color: Colors.transparent,
            child: SafeArea(
                child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: CustomAppBar(title: S.of(context).articles),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(
                          articles.length,
                          (index) => CardArticles(
                                article: articles[index],
                              )),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ),
            )),
          );
  }
}
