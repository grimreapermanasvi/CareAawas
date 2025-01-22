import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/role_selection_page.dart';
import 'screens/organization_languageSetting_page.dart' as org_lang_page;

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en', 'US');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  static LocaleProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<LocaleProvider>(context, listen: listen);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          title: 'Careआवास',
          debugShowCheckedModeBanner: false,
          locale: localeProvider.locale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
            Locale('mr', 'IN'),
            Locale('ta', 'IN'),
            Locale('gu', 'IN'),
            Locale('bn', 'IN'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale != null) {
              return supportedLocales.firstWhere(
                (supportedLocale) =>
                    supportedLocale.languageCode == locale.languageCode &&
                    supportedLocale.countryCode == locale.countryCode,
                orElse: () => supportedLocales.first,
              );
            }
            return supportedLocales.first;
          },
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: const RoleSelectionPage(),
          routes: {
            '/languageSettings': (context) =>
                const org_lang_page.LanguageSettingsPage(),
          },
        );
      },
    );
  }
}
