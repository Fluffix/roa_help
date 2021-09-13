import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:roa_help/Controllers/GeneralController.dart';
import 'package:roa_help/UI/Pages/Auth/NumericPad.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:roa_help/main.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({Key key}) : super(key: key);

  @override
  _ConfirmCodeState createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  String _code;
  String _nameAnimation;
  bool _isPlayingAnimation;
  bool _isShowNumberBox;

  @override
  void initState() {
    super.initState();
    _code = '';
    _isPlayingAnimation = false;
    _isShowNumberBox = true;
  }

  void startAnimation({@required bool codeMatch}) async {
    setState(() {
      if (codeMatch) {
        _nameAnimation = 'confirm';
      } else {
        _nameAnimation = 'error';
      }
    });
    setState(() {
      _isPlayingAnimation = true;
    });

    await Future.delayed(Duration(milliseconds: 15));
    setState(() {
      _isShowNumberBox = false;
    });

    if (codeMatch) {
      await Future.delayed(Duration(milliseconds: 2305));
    } else {
      await Future.delayed(Duration(milliseconds: 985));
    }

    setState(() {
      _isPlayingAnimation = false;
      _isShowNumberBox = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<GeneralController>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/welcomeNew.png',
              width: 220,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              '${S.of(context).start_the_bot}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 16,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                _isPlayingAnimation
                    ? Container(
                        width: 350,
                        height: 102,
                        child: RiveAnimation.asset(
                          "assets/animations/auth.riv",
                          animations: ["$_nameAnimation"],
                        ),
                      )
                    : SizedBox(),
                _isShowNumberBox
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildCodeNumberBox(
                                _code.length > 0 ? _code.substring(0, 1) : ""),
                            _buildCodeNumberBox(
                                _code.length > 1 ? _code.substring(1, 2) : ""),
                            _buildCodeNumberBox(
                                _code.length > 2 ? _code.substring(2, 3) : ""),
                            _buildCodeNumberBox(
                                _code.length > 3 ? _code.substring(3, 4) : ""),
                          ],
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(
              height: 34,
            ),
            _buildAuthButton(onTap: () async {
              if (_code.length == 4) {
                int statusCode = await controller.authController.auth(
                  context: context,
                  code: _code,
                  controller: controller,
                );
                if (statusCode == 201) {
                  if (!_isPlayingAnimation) {
                    _code = '';
                    startAnimation(codeMatch: true);
                    await Future.delayed(Duration(milliseconds: 2305));
                    Navigator.pushReplacementNamed(context, Routes.home);
                  }
                } else if (statusCode == 200) {
                  if (!_isPlayingAnimation) {
                    _code = '';
                    startAnimation(codeMatch: true);
                    await Future.delayed(Duration(milliseconds: 2305));
                    Navigator.pushReplacementNamed(context, Routes.home);
                  }
                } else {
                  if (!_isPlayingAnimation) {
                    _code = '';
                    startAnimation(codeMatch: false);
                  }
                }
              }
            }),
            SizedBox(
              height: 8,
            ),
            NumericPad(onNumberSelected: (value) {
              setState(() {
                try {
                  if (value != -1) {
                    if (_code.length < 4) {
                      _code += value.toString();
                    }
                  } else {
                    _code = _code.substring(0, _code.length - 1);
                  }
                } catch (e) {
                  print(e);
                }
              });
            }, onBotTap: () async {
              if (await canLaunch(botURL)) {
                await launch(botURL);
              } else {
                throw 'Could not launch $botURL';
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton({@required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          if (onTap != null) {
            onTap();
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
                child: Text("${S.of(context).login}",
                    style: Theme.of(context).textTheme.headline2)),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeNumberBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: Theme.of(context).splashColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: Theme.of(context).brightness == Brightness.light
                ? Style.shadowCard
                : null),
        child: Center(
          child: Text('$codeNumber',
              style:
                  Theme.of(context).textTheme.headline2.copyWith(fontSize: 22)),
        ),
      ),
    );
  }
}
