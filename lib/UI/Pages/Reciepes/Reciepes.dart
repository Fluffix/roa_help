import 'package:flutter/material.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/UI/Pages/Reciepes/ReciepesItemPage.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/models/ReciepesModel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

List<ReciepesModel> items = [
  ReciepesModel(
      id: 1,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 2,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 3,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 4,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 45,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 12,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 5,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 6,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 7,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
  ReciepesModel(
      id: 88,
      name: 'Бутерброд с лососем',
      time: '30 мин',
      ccal: "300 ккал",
      protein: 11,
      fat: 15,
      carbo: 22,
      ingredients: [
        '2 ломтика хлеба',
        '3 ст. л. творожного сыра',
        '2 ст. л. песто',
        '2 ломтика красной рыбы',
      ],
      description:
          'Хлеб смажьте творожным сыром, а затем песто. Сверху выложите красную рыбу и украсьте базиликом.',
      thumbnail: 'https://i.postimg.cc/zfYX2FvG/food.png'),
];

class Reciepes extends StatefulWidget {
  const Reciepes({Key key}) : super(key: key);

  @override
  _ReciepesState createState() => _ReciepesState();
}

class _ReciepesState extends State<Reciepes> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    setState(() => _loading = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: SecondAppBar(
            text: S.of(context).reciepes,
            onChange: () {
              Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: _loading
                  ? Shimmer.fromColors(
                      baseColor: Theme.of(context).brightness == Brightness.dark
                          ? Theme.of(context).cardColor
                          : Theme.of(context).disabledColor.withOpacity(0.25),
                      highlightColor: Theme.of(context).brightness ==
                              Brightness.dark
                          ? Theme.of(context).disabledColor.withOpacity(0.25)
                          : Theme.of(context).cardColor,
                      enabled: _loading,
                      child: Column(
                        children: List.generate(8, (index) {
                          return _buildLoading(Theme.of(context).disabledColor);
                        }),
                      ))
                  : Wrap(
                      runSpacing: 16,
                      children: List.generate(items.length, (index) {
                        return _buildSmallCard(
                            item: items[index],
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReciepesItemPage(
                                          item: items[index])));
                            });
                      })),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCard(
      {@required ReciepesModel item, @required Function onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.05))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                    tag: 'heroIndex${item.id}',
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: '${item.thumbnail}',
                      width: MediaQuery.of(context).size.width > 400 ? 100 : 80,
                      height:
                          MediaQuery.of(context).size.width > 400 ? 100 : 80,
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    Text('${item.name}',
                        style: MediaQuery.of(context).size.width > 400
                            ? Theme.of(context).primaryTextTheme.headline4
                            : Theme.of(context)
                                .primaryTextTheme
                                .headline4
                                .copyWith(fontSize: 14)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconSvg(IconsSvg.timer,
                                width: MediaQuery.of(context).size.width > 400
                                    ? 18
                                    : 14,
                                color: Theme.of(context).disabledColor),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${item.time}',
                                style: MediaQuery.of(context).size.width > 400
                                    ? Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                    : Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                        .copyWith(fontSize: 12))
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            IconSvg(IconsSvg.ccal,
                                width: MediaQuery.of(context).size.width > 400
                                    ? 18
                                    : 14,
                                color: Theme.of(context).disabledColor),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${item.ccal}',
                                style: MediaQuery.of(context).size.width > 400
                                    ? Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                    : Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1
                                        .copyWith(fontSize: 12))
                          ],
                        )
                      ],
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildLoading(Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.05))
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width > 400 ? 100 : 80,
                  height: MediaQuery.of(context).size.width > 400 ? 100 : 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90), color: color),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    Container(
                      width: 150,
                      color: color,
                      height: 8,
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 150,
                      color: color,
                      height: 8,
                    )
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
