import 'package:flutter/material.dart';
import 'package:roa_help/UI/General/widgets/SecondAppBar.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            _customAppBar(context),
            _calendar(),
            SizedBox(
              height: 100,
            ),
            Text('$_selectedDay')
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

  Widget _calendar() {
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
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = selectedDay; // update `_focusedDay` here as well
        });
      },
    );
  }
}
