import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/strings_manager.dart';
import 'package:movie_app/domain/entities/language_entity.dart';

class LanguagesManager {
  const LanguagesManager._();

  static const List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', value: AppStrings.english),
    LanguageEntity(code: 'es', value: AppStrings.spanish),
    LanguageEntity(code: 'ar', value: AppStrings.arabic),
  ];

  static List<Locale> languagesLocals = languages.map((lang) => Locale(lang.code)).toList();

  static const translationsPath = 'assets/translations';

  static toggleLanguage({required String languageCode, required BuildContext context}) async {
    await context.setLocale(Locale(languageCode));
  }
}
