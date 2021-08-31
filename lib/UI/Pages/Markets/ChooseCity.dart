import 'package:flutter/material.dart';
import 'package:roa_help/UI/General/widgets/Search.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';

List<String> cities = [
  'Москва',
  'Санкт-Петербург',
  'Саратов',
  'Краснодар',
  'Армовир',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
  'Махачкала',
];

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  TextEditingController searchCityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: SecondAppBar(
                text: S.of(context).choose_city,
                onChange: () {
                  Navigator.pop(context);
                },
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _search(),
                    SizedBox(height: 32),
                    Column(
                      children: List.generate(cities.length, (index) {
                        return _cityItem(index, context);
                      }),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Container _cityItem(int index, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: (index + 1) != cities.length
              ? Border(
                  bottom: BorderSide(
                      color: Style.inactiveColorDark.withOpacity(1.0),
                      width: 0.5))
              : null),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${cities[index]}',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline1
                    .copyWith(fontSize: 16)),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Style.secondary),
                borderRadius: BorderRadius.circular(90),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Search(
        controllerText: searchCityController,
        findHint: "${S.of(context).city_find}");
  }
}
