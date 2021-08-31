import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/Pages/Reciepes/Reciepes.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:swipedetector/swipedetector.dart';

class ReciepesItemPage extends StatefulWidget {
  final ReciepesModel item;
  const ReciepesItemPage({
    @required this.item,
    Key key,
  }) : super(key: key);

  @override
  _ReciepesItemPageState createState() => _ReciepesItemPageState();
}

class _ReciepesItemPageState extends State<ReciepesItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SwipeDetector(
        onSwipeRight: () {
          Navigator.pop(context);
        },
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Column(
                children: [
                  _backArrow(context, onTap: () {
                    Navigator.pop(context);
                  }),
                  SizedBox(height: 24),
                  _image(),
                  SizedBox(height: 32),
                  Text(
                    '${widget.item.name}',
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _foodInfo(context,
                            text: widget.item.time, icon: IconsSvg.timer),
                        _foodInfo(context,
                            text: widget.item.ccal, icon: IconsSvg.ccal),
                      ],
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    width: MediaQuery.of(context).size.width - 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _foodBJU(
                          context,
                          name: S.of(context).protein,
                          quantity: widget.item.protein,
                        ),
                        _foodBJU(
                          context,
                          name: S.of(context).fat,
                          quantity: widget.item.fat,
                        ),
                        _foodBJU(
                          context,
                          name: S.of(context).carbo,
                          quantity: widget.item.carbo,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${S.of(context).ingredients}',
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Column(
                    children:
                        List.generate(widget.item.ingredients.length, (index) {
                      return _ingredients(context,
                          name: widget.item.ingredients[index]);
                    }),
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${S.of(context).cooking}',
                      style: Theme.of(context).primaryTextTheme.headline1,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      '${widget.item.description}',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline1
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align _backArrow(BuildContext context, {@required Function onTap}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: IconSvg(IconsSvg.backArrow,
              width: 22, color: Theme.of(context).selectedRowColor)),
    );
  }

  Widget _image() {
    return Align(
      alignment: Alignment.center,
      child: Hero(
        tag: 'heroIndex${widget.item.id}',
        child: Image.network(
          '${widget.item.thumbnail}',
          width: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _foodInfo(BuildContext context,
      {@required String text, @required int icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).sliderTheme.inactiveTrackColor,
        borderRadius: BorderRadius.circular(90),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            IconSvg(icon,
                width: MediaQuery.of(context).size.width > 400 ? 20 : 16,
                color: Theme.of(context).disabledColor),
            SizedBox(width: 8),
            Text(
              '$text',
              style: MediaQuery.of(context).size.width > 400
                  ? Theme.of(context).primaryTextTheme.bodyText1
                  : Theme.of(context)
                      .primaryTextTheme
                      .bodyText1
                      .copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodBJU(
    BuildContext context, {
    @required String name,
    @required int quantity,
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: Theme.of(context).sliderTheme.inactiveTrackColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Style.inactiveColorMark.withOpacity(0.3)),
              child: Center(
                child: Text(
                  '$quantity',
                  style: MediaQuery.of(context).size.width > 400
                      ? Theme.of(context)
                          .primaryTextTheme
                          .headline4
                          .copyWith(fontSize: 14)
                      : Theme.of(context)
                          .primaryTextTheme
                          .headline4
                          .copyWith(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$name',
                      style: MediaQuery.of(context).size.width > 400
                          ? Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              .copyWith(fontSize: 14)
                          : Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              .copyWith(fontSize: 12)),
                  Text(
                    '${S.of(context).food_gramms}',
                    style: MediaQuery.of(context).size.width > 400
                        ? Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            .copyWith(fontSize: 12)
                        : Theme.of(context)
                            .primaryTextTheme
                            .bodyText1
                            .copyWith(fontSize: 10),
                  )
                ],
              ),
            ),
            SizedBox(width: 4.0)
          ],
        ),
      ),
    );
  }

  Widget _ingredients(BuildContext context, {@required String name}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).sliderTheme.inactiveTrackColor,
            borderRadius: BorderRadius.circular(90),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Text(
              '$name',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4
                  .copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
