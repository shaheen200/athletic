import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'provider/theme/light.dart';
import 'start_page/splash_screen.dart';

void main() {
  runApp(const Athletic());
}

class Athletic extends StatelessWidget {
  const Athletic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const <Locale>[Locale('en', ''), Locale('ar', '')],
      localeResolutionCallback: (locales, supportedLocales) {
        return supportedLocales.last;
      },
      localeListResolutionCallback: (locales, supportedLocales) {
        return supportedLocales.last;
      },
      debugShowCheckedModeBanner: false,
      title: 'Athletic',
      theme: lightTheme,
      home: const Splash(),
    );
  }
}
