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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select Language`
  String get txt_select_language {
    return Intl.message(
      'Select Language',
      name: 'txt_select_language',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get txt_password {
    return Intl.message(
      'Password',
      name: 'txt_password',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get txt_username {
    return Intl.message(
      'Username',
      name: 'txt_username',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get txt_home {
    return Intl.message(
      'Home',
      name: 'txt_home',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get txt_logout {
    return Intl.message(
      'Logout',
      name: 'txt_logout',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get txt_search {
    return Intl.message(
      'Search',
      name: 'txt_search',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get txt_account {
    return Intl.message(
      'Account',
      name: 'txt_account',
      desc: '',
      args: [],
    );
  }

  /// `System Error!`
  String get txt_system_error {
    return Intl.message(
      'System Error!',
      name: 'txt_system_error',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get txt_message1 {
    return Intl.message(
      'Message',
      name: 'txt_message1',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get txt_message {
    return Intl.message(
      'Message',
      name: 'txt_message',
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
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
