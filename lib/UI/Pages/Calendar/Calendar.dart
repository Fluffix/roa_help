import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roa_help/Controllers/AuthController.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/Requests/Home/Feelings/GetFeelingsSerialise.dart';
import 'package:roa_help/Requests/Stats/Stats.dart';
import 'package:roa_help/Requests/Stats/StatsSerialise.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
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

  @override
  void initState() {
    _loading = true;
    _token = widget.token;
    load(token: _token);
    super.initState();
  }

  void load({@required String token}) async {
    setState(() {
      _loading = true;
    });
    // Request func in this place
    db = await getStats(token: token);

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context).authController;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            _customAppBar(context),
            _calendar(token: _token),
            _content()
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
        print(date[0]);
        db = await getStats(date: date[0], token: token);
      },
    );
  }

  Widget _content() {
    return Column(
      children: [
        // _buildHedline('${S.of(context).morning}'),
        // _buildTakingMedication('2021-15-25', '156'),
        // _buildHedline('${S.of(context).evening}'),
        // _buildTakingMedication('2021-15-25', '156'),
        // _buildHedline('${S.of(context).side_effects}'),
        // Wrap(
        //   children: List.generate(db.sideEffects.length, (index) {
        //     return _buildSideEffects(
        //         db.sideEffects.items, db.sideEffects.color);
        //   }),
        // ),
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

  Widget _buildTakingMedication(String time, String fats) {
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
              Text(''),
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
                      .copyWith(fontSize: 16))
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSideEffects(List<SideEffectItem> items, String color) {
    return Wrap(
      children: List.generate(items.length, (index) {
        return Container(
          decoration: BoxDecoration(
              color: Color(int.parse(color)),
              borderRadius: BorderRadius.circular(15)),
        );
      }),
    );
  }
}
