import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en_US': {
      'appTitle': 'Careआवास',
      'manageDoctors': 'Manage Doctors',
      'managePatients': 'Manage Patients',
      'trackNGO': 'Track NGO Activity',
      'viewAnalytics': 'View Analytics',
      'settings': 'Settings',
      'languageSettings': 'Language Settings',
      'selectLanguage': 'Select Language',
      'english': 'English',
      'hindi': 'Hindi',
      'welcome': 'Welcome',
      'login': 'Login',
      'signup': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'submit': 'Submit',
      'cancel': 'Cancel',
      // Add all your app strings here
    },
    'hi_IN': {
      'appTitle': 'Careआवास',
      'manageDoctors': 'डॉक्टरों का प्रबंधन',
      'managePatients': 'रोगियों का प्रबंधन',
      'trackNGO': 'एनजीओ गतिविधि ट्रैक करें',
      'viewAnalytics': 'विश्लेषण देखें',
      'settings': 'समायोजन',
      'languageSettings': 'भाषा समायोजन',
      'selectLanguage': 'भाषा चुनें',
      'english': 'अंग्रेज़ी',
      'hindi': 'हिंदी',
      'welcome': 'स्वागत है',
      'login': 'लॉग इन करें',
      'signup': 'साइन अप करें',
      'email': 'ईमेल',
      'password': 'पासवर्ड',
      'submit': 'जमा करें',
      'cancel': 'रद्द करें',
      // Add all your app strings here
    }
  };

  String get(String key) {
    return _localizedValues[locale.toString()]?[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return Future.value(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
