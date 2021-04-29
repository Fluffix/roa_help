// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Как избавиться от сухости глаз?`
  String get articles_head {
    return Intl.message(
      'Как избавиться от сухости глаз?',
      name: 'articles_head',
      desc: '',
      args: [],
    );
  }

  /// `Сухость глаз является неприятным ощущением, вызванным раздражением рецепторов конъюнктивы век или роговицы.`
  String get articles_body {
    return Intl.message(
      'Сухость глаз является неприятным ощущением, вызванным раздражением рецепторов конъюнктивы век или роговицы.',
      name: 'articles_body',
      desc: '',
      args: [],
    );
  }

  /// `Roa Help`
  String get app_name {
    return Intl.message(
      'Roa Help',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Потребление воды`
  String get water_control {
    return Intl.message(
      'Потребление воды',
      name: 'water_control',
      desc: '',
      args: [],
    );
  }

  /// `1 прием`
  String get first_peaunts {
    return Intl.message(
      '1 прием',
      name: 'first_peaunts',
      desc: '',
      args: [],
    );
  }

  /// `2 прием`
  String get second_peaunts {
    return Intl.message(
      '2 прием',
      name: 'second_peaunts',
      desc: '',
      args: [],
    );
  }

  /// `Состояние`
  String get feeling {
    return Intl.message(
      'Состояние',
      name: 'feeling',
      desc: '',
      args: [],
    );
  }

  /// `Рецепты`
  String get recieps {
    return Intl.message(
      'Рецепты',
      name: 'recieps',
      desc: '',
      args: [],
    );
  }

  /// `г. съедено`
  String get gramms_eating {
    return Intl.message(
      'г. съедено',
      name: 'gramms_eating',
      desc: '',
      args: [],
    );
  }

  /// `шт.`
  String get pieces {
    return Intl.message(
      'шт.',
      name: 'pieces',
      desc: '',
      args: [],
    );
  }

  /// `стаканов`
  String get glasses {
    return Intl.message(
      'стаканов',
      name: 'glasses',
      desc: '',
      args: [],
    );
  }

  /// `побочек`
  String get quantity_of_feelings {
    return Intl.message(
      'побочек',
      name: 'quantity_of_feelings',
      desc: '',
      args: [],
    );
  }

  /// `Поставить напоминание`
  String get notification {
    return Intl.message(
      'Поставить напоминание',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Изменить почту`
  String get mail {
    return Intl.message(
      'Изменить почту',
      name: 'mail',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get password {
    return Intl.message(
      'Изменить пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Город`
  String get city {
    return Intl.message(
      'Город',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Дневная норма воды`
  String get water_norm {
    return Intl.message(
      'Дневная норма воды',
      name: 'water_norm',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}