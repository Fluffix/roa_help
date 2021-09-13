import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Controllers/WaterController.dart';
import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  final String token;
  const CalendarScreen({Key key, this.token}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _loading;
  StatsSerialise db;
  String _token;
  bool isStatsEmpty;

  @override
  void initState() {
    _loading = true;
    _token = widget.token;
    isStatsEmpty = false;
    load(token: _token);

    super.initState();
  }

  Future<void> load({@required String token, String date}) async {
    setState(() {
      _loading = true;
    });
    // Request func in this place
    db = await getStats(token: token, date: date);
    isStatsEmpty = false;
    if (db.water == 0 && db.drugs.first == null && db.drugs.second == null) {
      isStatsEmpty = true;
      db.sideEffects.forEach((element) {
        if (element.items.length > 0) {
          print('d');
          isStatsEmpty = false;
          return;
        }
      });
    }
    // await Future.delayed(Duration(seconds: 5));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).waterController;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            _customAppBar(context),
            _calendar(token: _token),
            _content(controller)
          ]),
        ),
      ),
    );
  }

  Widget _customAppBar(BuildContext context) {
    return SecondAppBar(
      text: '${S.of(context).calendar}',
      onChange: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _calendar({@required String token}) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      locale: 'ru_RU',
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: Theme.of(context).primaryTextTheme.headline1),
      calendarFormat: CalendarFormat.month,
      calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          todayDecoration: BoxDecoration(
            color: Theme.of(context).focusColor.withOpacity(0.55),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).focusColor.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
          defaultTextStyle: Theme.of(context)
              .primaryTextTheme
              .headline1
              .copyWith(fontSize: 16),
          selectedTextStyle: Theme.of(context)
              .primaryTextTheme
              .headline1
              .copyWith(fontSize: 16),
          todayTextStyle: Theme.of(context)
              .primaryTextTheme
              .headline1
              .copyWith(fontSize: 16)),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) async {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = selectedDay;
        });
        final List<String> date = selectedDay.toString().split(' ');
        await load(token: token, date: date[0]);
      },
    );
  }

  Widget _content(WaterController controller) {
    return _loading
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).sliderTheme.activeTrackColor,
              ),
            ),
          )
        : isStatsEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Column(
                  children: [
                    IconSvg(IconsSvg.folder,
                        width: 120,
                        color: Theme.of(context).focusColor.withOpacity(0.65)),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${S.of(context).no_data}',
                      style: Theme.of(context).textTheme.headline2,
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  _buildHedline('${S.of(context).morning}'),
                  _buildTakingMedication(db.drugs.first),
                  _buildHedline('${S.of(context).evening}'),
                  _buildTakingMedication(db.drugs.second),
                  _buildHedline('${S.of(context).water_control}'),
                  _buildWaterProgress(
                      db.water * 100 ~/ controller.data.waterDayNorm),
                  _buildHedline('${S.of(context).side_effects}'),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: List.generate(db.sideEffects.length, (index) {
                      return _buildSideEffects(db.sideEffects[index].items,
                          db.sideEffects[index].color);
                    }),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  // _buildHedline('${S.of(context).water_control}'),
                ],
              );
  }

  Widget _buildHedline(String labelText) {
    return Container(
      color: Theme.of(context).sliderTheme.inactiveTrackColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Center(
          child: Text('$labelText',
              style: Theme.of(context).textTheme.headline6.copyWith(
                  fontSize: 16, color: Theme.of(context).selectedRowColor)),
        ),
      ),
    );
  }

  Widget _buildTakingMedication(Take meal) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${S.of(context).time}:',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline1
                    .copyWith(fontSize: 16),
              ),
              Text(
                meal != null ? ' ${meal.date}' : ' ---',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline1
                    .copyWith(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text('${S.of(context).fat}:',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline1
                      .copyWith(fontSize: 16)),
              Text(
                meal != null ? ' ${meal.fat}' : ' ---',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline1
                    .copyWith(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWaterProgress(int progress) {
    

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Stack(children: [
        Center(
          child: Container(
            width: 300,
            height: 30,
            child: RiveAnimation.asset(
              Theme.of(context).brightness == Brightness.light
                  ? "assets/animations/waterLight.riv"
                  : "assets/animations/waterDark.riv",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Align(
            alignment: Alignment.center,
            child: Text('$progress %',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline1
                    .copyWith(fontSize: 16, color: Style.white)),
          ),
        )
      ]),
    );
  }

  Widget _buildSideEffects(List<SideEffectItem> items, String color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: Color(int.parse(color)), shape: BoxShape.circle),
                ),
                SizedBox(
                  width: 12,
                ),
                Text('${items[index].description}',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline1
                        .copyWith(fontSize: 16)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
