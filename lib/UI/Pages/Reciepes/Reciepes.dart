import 'package:flutter/material.dart';
import 'package:roa_help/UI/Pages/Reciepes/ReciepesItemPage.dart';
import 'package:roa_help/UI/widgets/SecondAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class ReciepesModel {
  final int id;
  final String name;
  final String time;
  final String ccal;
  final int protein;
  final int fat;
  final int carbo;
  final List<String> ingredients;
  final String description;
  final String thumbnail;

  ReciepesModel(
      {@required this.id,
      @required this.name,
      @required this.time,
      @required this.ccal,
      @required this.protein,
      @required this.fat,
      @required this.carbo,
      @required this.ingredients,
      @required this.description,
      @required this.thumbnail});
}

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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Wrap(
                    runSpacing: 16,
                    children: List.generate(items.length, (index) {
                      return _buildSmallCard(
                          item: items[index],
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReciepesItemPage(item: items[index])));
                          });
                    })),
              ),
            ),
          ),
        ));
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
                    child: Image.network(
                      '${item.thumbnail}',
                      fit: BoxFit.fill,
                      width: 100,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(children: [
                    Text('${item.name}',
                        style: Theme.of(context).primaryTextTheme.headline4),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconSvg(IconsSvg.timer,
                                width: 18,
                                color: Theme.of(context).disabledColor),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${item.time}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1)
                          ],
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Row(
                          children: [
                            IconSvg(IconsSvg.ccal,
                                width: 18,
                                color: Theme.of(context).disabledColor),
                            SizedBox(
                              width: 4,
                            ),
                            Text('${item.ccal}',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1)
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
}
