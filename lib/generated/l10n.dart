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

  /// `прием`
  String get meal {
    return Intl.message(
      'прием',
      name: 'meal',
      desc: '',
      args: [],
    );
  }

  /// `Здоровье`
  String get feeling {
    return Intl.message(
      'Здоровье',
      name: 'feeling',
      desc: '',
      args: [],
    );
  }

  /// `Рецепты`
  String get reciepes {
    return Intl.message(
      'Рецепты',
      name: 'reciepes',
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

  /// `Город`
  String get choose_city {
    return Intl.message(
      'Город',
      name: 'choose_city',
      desc: '',
      args: [],
    );
  }

  /// `Выберите препарат`
  String get choose_drug {
    return Intl.message(
      'Выберите препарат',
      name: 'choose_drug',
      desc: '',
      args: [],
    );
  }

  /// `ПОИСК`
  String get find {
    return Intl.message(
      'ПОИСК',
      name: 'find',
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

  /// `Статьи`
  String get articles {
    return Intl.message(
      'Статьи',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Поиск препарата`
  String get search_markets {
    return Intl.message(
      'Поиск препарата',
      name: 'search_markets',
      desc: '',
      args: [],
    );
  }

  /// `Счётчик жиров`
  String get fats_calc {
    return Intl.message(
      'Счётчик жиров',
      name: 'fats_calc',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get done {
    return Intl.message(
      'Готово',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Поиск блюда`
  String get food_find {
    return Intl.message(
      'Поиск блюда',
      name: 'food_find',
      desc: '',
      args: [],
    );
  }

  /// `Поиск города`
  String get city_find {
    return Intl.message(
      'Поиск города',
      name: 'city_find',
      desc: '',
      args: [],
    );
  }

  /// `Побочные эффекты`
  String get side_effects {
    return Intl.message(
      'Побочные эффекты',
      name: 'side_effects',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Утренний приём`
  String get morning {
    return Intl.message(
      'Утренний приём',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Вечерний приём`
  String get evening {
    return Intl.message(
      'Вечерний приём',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `Текущий пароль`
  String get current_password {
    return Intl.message(
      'Текущий пароль',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get new_password {
    return Intl.message(
      'Новый пароль',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Повторите пароль`
  String get repeat_password {
    return Intl.message(
      'Повторите пароль',
      name: 'repeat_password',
      desc: '',
      args: [],
    );
  }

  /// `Введите имя пользователя`
  String get input_user_name {
    return Intl.message(
      'Введите имя пользователя',
      name: 'input_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Введите пароль`
  String get input_pass {
    return Intl.message(
      'Введите пароль',
      name: 'input_pass',
      desc: '',
      args: [],
    );
  }

  /// `Добро Пожаловать!`
  String get welcome {
    return Intl.message(
      'Добро Пожаловать!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `ВОЙТИ`
  String get login {
    return Intl.message(
      'ВОЙТИ',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `РЕГИСТРАЦИЯ`
  String get signin {
    return Intl.message(
      'РЕГИСТРАЦИЯ',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Введите код`
  String get confirm_code {
    return Intl.message(
      'Введите код',
      name: 'confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `Настало время приёма препарата`
  String get time_take_drug {
    return Intl.message(
      'Настало время приёма препарата',
      name: 'time_take_drug',
      desc: '',
      args: [],
    );
  }

  /// `гр.`
  String get gramms {
    return Intl.message(
      'гр.',
      name: 'gramms',
      desc: '',
      args: [],
    );
  }

  /// `Календарь`
  String get calendar {
    return Intl.message(
      'Календарь',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Роаккутан капс. 10 мг.`
  String get roa_10mg {
    return Intl.message(
      'Роаккутан капс. 10 мг.',
      name: 'roa_10mg',
      desc: '',
      args: [],
    );
  }

  /// `Роаккутан капс. 20 мг.`
  String get roa_20mg {
    return Intl.message(
      'Роаккутан капс. 20 мг.',
      name: 'roa_20mg',
      desc: '',
      args: [],
    );
  }

  /// `Акнекутан капс. 8 мг.`
  String get akne_8mg {
    return Intl.message(
      'Акнекутан капс. 8 мг.',
      name: 'akne_8mg',
      desc: '',
      args: [],
    );
  }

  /// `Акнекутан капс. 16 мг.`
  String get akne_16mg {
    return Intl.message(
      'Акнекутан капс. 16 мг.',
      name: 'akne_16mg',
      desc: '',
      args: [],
    );
  }

  /// `Другое`
  String get other {
    return Intl.message(
      'Другое',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `грамм`
  String get food_gramms {
    return Intl.message(
      'грамм',
      name: 'food_gramms',
      desc: '',
      args: [],
    );
  }

  /// `Белки`
  String get protein {
    return Intl.message(
      'Белки',
      name: 'protein',
      desc: '',
      args: [],
    );
  }

  /// `Жиры`
  String get fat {
    return Intl.message(
      'Жиры',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Углеводы`
  String get carbo {
    return Intl.message(
      'Углеводы',
      name: 'carbo',
      desc: '',
      args: [],
    );
  }

  /// `Ингредиенты`
  String get ingredients {
    return Intl.message(
      'Ингредиенты',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Приготовление`
  String get cooking {
    return Intl.message(
      'Приготовление',
      name: 'cooking',
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