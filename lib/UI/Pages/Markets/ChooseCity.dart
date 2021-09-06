import 'package:flutter/material.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

String chosenCity;

class ChooseCity extends StatefulWidget {
  @override
  _ChooseCityState createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  TextEditingController searchCityController = TextEditingController();
  bool loading = true;
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
    final List<dynamic> cities = ModalRoute.of(context).settings.arguments;
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
                onChange: () async {
                  if (chosenCity != null) {
                    _saveCity(chosenCity);
                  }
                  Navigator.pop(context, chosenCity);
                },
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Column(
                      children: List.generate(cities.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              chosenCity = cities[index].toString();
                            });
                          },
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            decoration: BoxDecoration(
                                border: (index + 1) != cities.length
                                    ? Border(
                                        bottom: BorderSide(
                                            color: Style.inactiveColorDark
                                                .withOpacity(1.0),
                                            width: 0.5))
                                    : null),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        border: Border.all(
                                            width: 2, color: Style.secondary),
                                        borderRadius: BorderRadius.circular(90),
                                      ),
                                      child: cities[index].toString() ==
                                              chosenCity
                                          ? Center(
                                              child: Container(
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .focusColor,
                                                  borderRadius:
                                                      BorderRadius.circular(90),
                                                ),
                                              ),
                                            )
                                          : SizedBox())
                                ],
                              ),
                            ),
                          ),
                        );
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

  // Widget _search() {
  //   return Search(
  //       controllerText: searchCityController,
  //       findHint: "${S.of(context).city_find}");
  // }

  Future<void> _saveCity(String city) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('city', city);
  }
}

Future<String> getCity() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString('city');
}
