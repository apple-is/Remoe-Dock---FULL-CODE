import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _boxName = 'settings';
  static const String _key = 'language';

  Locale _locale = const Locale('de');

  Locale get locale => _locale;

  LanguageProvider() {
    _loadLanguage();
  }

  void _loadLanguage() {
    final box = Hive.box(_boxName);
    final saved = box.get(_key, defaultValue: 'system') as String? ?? 'system';

    if (saved == 'system') {
      final systemLocale = PlatformDispatcher.instance.locale;
      _locale = Locale(systemLocale.languageCode);
    } else {
      _locale = Locale(saved);
    }
  }

  void setLanguage(String code) {
    final box = Hive.box(_boxName);
    if (code == 'system') {
      box.put(_key, 'system');
      final systemLocale = PlatformDispatcher.instance.locale;
      _locale = Locale(systemLocale.languageCode);
    } else {
      box.put(_key, code);
      _locale = Locale(code);
    }
    notifyListeners();
  }
}
