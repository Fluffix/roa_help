import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Requests/Cities/Cities.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/UI/Pages/Markets/ChooseCity.dart';
import 'package:roa_help/UI/Pages/Markets/ChooseDrug.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  int selectedIndex = 1;
  List<String> drugs;
  bool loading = true;
  String chosenCity;
  @override
  void initState() {
    load();
    super.initState();
    setState(() {});
  }

  void load() async {
    loading = true;
    setState(() {});
    chosenCity = await getCity();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    drugs = [
      "${S.of(context).choose_drug}",
      "${S.of(context).roa_10mg}",
      "${S.of(context).roa_20mg}",
      "${S.of(context).akne_8mg}",
      "${S.of(context).akne_16mg}",
    ];
    return Material(
        color: Colors.transparent,
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (360 / 896),
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.color,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
            ),
          ),
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      _labelText(context),
                      SizedBox(
                        height: 24,
                      ),
                      _chooseDrug(context),
                      SizedBox(
                        height: 16,
                      ),
                      _findCity(context),
                      SizedBox(
                        height: 16,
                      ),
                      _findButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  Text _labelText(BuildContext context) {
    return Text('${S.of(context).search_markets}',
        style:
            Theme.of(context).textTheme.headline1.copyWith(color: Style.black));
  }

  Widget _chooseDrug(BuildContext context) {
    return DirectSelect(
      items: _buildItem(),
      onSelectedItemChanged: (index) {
        setState(() {
          if (index != 0) {
            selectedIndex = index;
          }
        });
      },
      itemExtent: 60,
      child: Selectable(
        title: drugs[selectedIndex],
        isForList: false,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      mode: DirectSelectMode.tap,
    );
  }

  Widget _findCity(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var cities = await getCities();
        var result = await Navigator.pushNamed(context, Routes.chooseCity,
            arguments: cities);
        if (result != null) {
          chosenCity = result;
          setState(() {});
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 210 / 414,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).focusColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Row(
            children: [
              IconSvg(IconsSvg.chooseCity, width: 16),
              SizedBox(
                width: 16,
              ),
              Text(
                chosenCity != null
                    ? '$chosenCity'
                    : '${S.of(context).choose_city}',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _findButton() {
    return GestureDetector(
      onTap: () {
        removeToken();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 138 / 414,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).focusColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              '${S.of(context).find}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }

  List _buildItem() {
    return drugs
        .map((e) => Selectable(
              title: e,
            ))
        .toList();
  }
}
