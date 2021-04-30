import 'package:flutter/material.dart';
import 'package:roa_help/UI/widgets/Background.dart';
import 'package:roa_help/UI/widgets/CustomAppBar.dart';
import 'package:roa_help/Utils/Svg/IconSvg.dart';
import 'package:roa_help/generated/l10n.dart';

import '../../../Style.dart';

class Markets extends StatefulWidget {
  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Background(numberPage: 2)),
            SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: CustomAppBar(
                    title: S.of(context).app_name,
                    icon: IconsSvg.calendar,
                    color: Theme.of(context).accentColor),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        findCity(context),
                        SizedBox(
                          height: 16,
                        ),
                        chooseDrug(context),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 138 / 414,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: cDarkIcon,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  '${S.of(context).find}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  GestureDetector chooseDrug(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 210 / 414,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cDarkIcon,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
          child: Row(
            children: [
              IconSvg(IconsSvg.chooseDrug, width: 16),
              SizedBox(
                width: 16,
              ),
              Text(
                '${S.of(context).chooseDrug}',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget findCity(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 272 / 414,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cDarkIcon,
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
                '${S.of(context).chooseCity}',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
