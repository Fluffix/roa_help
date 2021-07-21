import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/generated/l10n.dart';

class Auth extends StatefulWidget {
  const Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool registration = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  ScrollController scrollController = ScrollController();
  double animatedContainerHeight = 136;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.height > 795
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 108,
              child: Column(
                children: [
                  _authButton(
                      context, cWhite, Colors.black, S.of(context).login,
                      onTap: () {
                    if (registration == false) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      registration = false;
                    }

                    setState(() {});
                  }),
                  SizedBox(
                    height: 8,
                  ),
                  _authButton(
                      context, Colors.black, Colors.white, S.of(context).signin,
                      onTap: () {
                    if (registration == true) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      registration = true;
                    }

                    setState(() {});
                  }),
                ],
              ),
            ),
            backgroundColor: Color.fromRGBO(214, 148, 242, 1),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/welcomeNew.png',
                          width: 300,
                        ),
                        Text(
                          '${S.of(context).welcome}',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline1
                              .copyWith(fontSize: 30),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 600),
                          child: Column(
                            children: [
                              _inputTextContainer(usernameController,
                                  S.of(context).input_userName),
                              SizedBox(
                                height: 16,
                              ),
                              _inputTextContainer(
                                  passwordController, S.of(context).input_pass),
                              SizedBox(
                                height: 16,
                              ),
                              _confirmPassword(registration),
                              SizedBox(
                                height: 16,
                              ),
                              _chooseCity(registration),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        //  Second Scaffold for small screens
        : Scaffold(
            backgroundColor: Color.fromRGBO(214, 148, 242, 1),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/welcomeNew.png',
                        width: 255,
                      ),
                      Text(
                        '${S.of(context).welcome}',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline1
                            .copyWith(fontSize: 30),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      _inputTextContainer(
                          usernameController, S.of(context).input_userName),
                      SizedBox(
                        height: 16,
                      ),
                      _inputTextContainer(
                          passwordController, S.of(context).input_pass),
                      registration
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                _confirmPassword(registration),
                                SizedBox(
                                  height: 16,
                                ),
                                _chooseCity(registration)
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        height: 108,
                        child: Column(
                          children: [
                            _authButton(context, cWhite, Colors.black,
                                S.of(context).login, onTap: () {
                              print(registration);
                              if (registration == false) {
                                Navigator.pushNamed(context, '/login');
                              } else {
                                print(MediaQuery.of(context).size.height);
                                registration = false;
                              }

                              setState(() {});
                            }),
                            SizedBox(
                              height: 8,
                            ),
                            _authButton(context, Colors.black, Colors.white,
                                S.of(context).signin, onTap: () {
                              print(registration);
                              if (registration == true) {
                                Navigator.pushNamed(context, '/login');
                              } else {
                                registration = true;
                              }

                              setState(() {});
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _inputTextContainer(
      TextEditingController textcontroller, String hintText) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: cWhite.withOpacity(0.25),
          borderRadius: BorderRadius.circular(14)),
      child: Center(
          child: TextField(
        controller: textcontroller,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(color: cWhite.withOpacity(0.55)),
        decoration: InputDecoration(
            hintText: '$hintText',
            hintStyle: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: cWhite.withOpacity(0.55)),
            border: InputBorder.none),
      )),
    );
  }

  Widget _authButton(
      BuildContext context, Color color, Color textColor, String text,
      {Function onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            '$text',
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: textColor),
          ),
        ),
      ),
    );
  }

  Widget _confirmPassword(bool registration) {
    return AnimatedOpacity(
      opacity: registration ? 1 : 0,
      duration: Duration(milliseconds: 400),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) {
            if (focus) {
              scrollController.jumpTo(100);
            }
          },
          child: _inputTextContainer(
              confirmPasswordController, S.of(context).confirm_pass),
        ),
      ),
    );
  }

  Widget _chooseCity(bool registration) {
    return AnimatedOpacity(
      opacity: registration ? 1 : 0,
      duration: Duration(milliseconds: 400),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/chooseCity');
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: cWhite.withOpacity(0.25),
              borderRadius: BorderRadius.circular(14)),
          child: Center(
              child: Text(
            '${S.of(context).choose_city}',
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: cWhite.withOpacity(0.55)),
          )),
        ),
      ),
    );
  }
}
