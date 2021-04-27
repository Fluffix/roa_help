import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roa_help/Routes.dart';
import 'package:roa_help/Style.dart';
import 'package:roa_help/UI/General.dart';
import 'package:roa_help/generated/l10n.dart';
import 'package:flutter/services.dart';

import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          initialRoute: Routes.home,
          routes: <String, WidgetBuilder>{
            Routes.home: (BuildContext context) => General(),
          },
        ),
      ),
    );
  }
}
