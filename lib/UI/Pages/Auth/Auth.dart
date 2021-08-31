import 'package:flutter/material.dart';
import 'package:roa_help/Requests/Auth/Auth.dart';
import 'package:roa_help/Utils/Routes/Routes.dart';
import 'package:roa_help/Utils/Style/Style.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 108,
                child: Column(
                  children: [
                    _authButton(
                        context, Style.white, Colors.black, S.of(context).login,
                        onTap: () {
                      if (registration == false) {
                        authLogic(isLogin: true);
                      } else {
                        usernameController.clear();
                        passwordController.clear();
                        registration = false;
                      }

                      setState(() {});
                    }),
                    SizedBox(
                      height: 8,
                    ),
                    _authButton(context, Colors.black, Colors.white,
                        S.of(context).signin, onTap: () async {
                      if (registration == true) {
                        authLogic(isLogin: false);
                      } else {
                        usernameController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
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
                                    S.of(context).input_user_name),
                                SizedBox(
                                  height: 16,
                                ),
                                _inputTextContainer(passwordController,
                                    S.of(context).input_pass,
                                    isPass: true),
                                SizedBox(
                                  height: 16,
                                ),
                                _confirmPassword(
                                  registration,
                                ),
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
            ),
          )
        //  Second Scaffold for small screens
        : GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
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
                            usernameController, S.of(context).input_user_name),
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
                              _authButton(context, Style.white, Colors.black,
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
            ),
          );
  }

  Widget _inputTextContainer(
      TextEditingController textcontroller, String hintText,
      {bool isPass = false}) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Style.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(14)),
      child: Center(
          child: TextField(
        controller: textcontroller,
        obscureText: isPass,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(color: Style.white.withOpacity(0.55)),
        decoration: InputDecoration(
            hintText: '$hintText',
            hintStyle: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Style.white.withOpacity(0.55)),
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
              confirmPasswordController, S.of(context).repeat_password,
              isPass: true),
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
              color: Style.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(14)),
          child: Center(
              child: Text(
            '${S.of(context).choose_city}',
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(color: Style.white.withOpacity(0.55)),
          )),
        ),
      ),
    );
  }

  authLogic({@required bool isLogin}) async {
    if (isLogin) {
      int statusCode = await authRequest(
        auth: "auth",
        userName: usernameController.text,
        password: passwordController.text,
      );
      print(statusCode);
      switch (statusCode) {
        case 201:
          // StatsSerialise db = await getStats();
          // print("AAAAA ${db.water}");
          Navigator.pushNamed(
            context, Routes.home,
            // arguments: <StatsSerialise>{db}
          );
          break;
        case 403:
          exceptionToast('Username or password not correct');
          break;
      }
    } else {
      if (usernameController.text.isEmpty) {
        exceptionToast('empty username');
      } else if (passwordController.text.length < 8) {
        exceptionToast('password unsafe');
      } else if (passwordController.text != confirmPasswordController.text) {
        exceptionToast('passwords differ');
      } else {
        int statusCode = await authRequest(
          auth: "register",
          userName: usernameController.text,
          password: passwordController.text,
        );
        print(statusCode);
        switch (statusCode) {
          case 200:
            Navigator.pushNamed(context, '/home');
            break;
          case 422:
            exceptionToast('The username has already been taken');
            break;
        }
      }
    }
  }

  Future<bool> exceptionToast(String toastText) {
    return Fluttertoast.showToast(
        msg: "$toastText",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.red,
        backgroundColor: Colors.green,
        fontSize: 16.0);
  }
}
