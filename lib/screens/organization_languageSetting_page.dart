import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({Key? key}) : super(key: key);

  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = '${Intl.getCurrentLocale()}';
  }

  void _changeLanguage(String? languageCode) {
    if (languageCode == null) return;

    setState(() {
      _selectedLanguage = languageCode;
    });

    final locale = Locale(
      languageCode.split('_')[0],
      languageCode.split('_')[1],
    );
    Provider.of<LocaleProvider>(context, listen: false).setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Language',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedLanguage,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: 'en_US',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'hi_IN',
                    child: Text('हिंदी (Hindi)'),
                  ),
                  DropdownMenuItem(
                    value: 'mr_IN',
                    child: Text('मराठी (Marathi)'),
                  ),
                  DropdownMenuItem(
                    value: 'ta_IN',
                    child: Text('தமிழ் (Tamil)'),
                  ),
                  DropdownMenuItem(
                    value: 'gu_IN',
                    child: Text('ગુજરાતી (Gujarati)'),
                  ),
                  DropdownMenuItem(
                    value: 'bn_IN',
                    child: Text('বাংলা (Bengali)'),
                  ),
                ],
                onChanged: _changeLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
