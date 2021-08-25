import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roa_help/Routes.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/General.dart';
import 'package:roa_help/UI/Pages/Markets/ChooseCity.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:flutter/services.dart';

import 'UI/Pages/Auth/Auth.dart';

const String apiURL = 'http://sithell.me/roa';
// 'https://c3adf358-8854-476b-8a0d-0119a767c748.mock.pstmn.io';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return AdaptiveTheme(
      light: kLightTheme,
      dark: kDarkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (light, dark) => Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          initialRoute: Routes.welcomeNew,
          routes: <String, WidgetBuilder>{
            Routes.home: (BuildContext context) => General(),
            Routes.welcomeNew: (BuildContext context) => Auth(),
            Routes.chooseCity: (BuildContext context) => ChooseCity(),
          },
        ),
      ),
    );
  }
}
