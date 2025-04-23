import 'package:athletic/controller/change_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'provider/theme/light.dart';
import 'start_page/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getProviderValue();
  runApp(const Athletic());
}

class Athletic extends StatefulWidget {
  const Athletic({super.key});
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AthleticState>()?.restartApp();
  }

  @override
  State<Athletic> createState() => _AthleticState();
}

class _AthleticState extends State<Athletic> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey(); // Force rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeProvider(),
      builder: (context, child) {
        final provider = Provider.of<ChangeProvider>(context);
        return KeyedSubtree(
          key: _key,
          child: MaterialApp(
            localizationsDelegates: const <LocalizationsDelegate<Object>>[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
            localeResolutionCallback: (locales, supportedLocales) {
              return provider.isEn
                  ? supportedLocales.first
                  : supportedLocales.last;
            },
            localeListResolutionCallback: (locales, supportedLocales) {
              return provider.isEn
                  ? supportedLocales.first
                  : supportedLocales.last;
            },
            debugShowCheckedModeBanner: false,
            title: 'Eagle Gym',
            theme: lightTheme,
            home: const Splash(),
          ),
        );
      },
    );
  }
}
