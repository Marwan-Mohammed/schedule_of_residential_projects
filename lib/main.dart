import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import 'sehedule_of_residential_projects_app.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig('').init(newContext: context, originalH: 844, originalW: 390);
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'الجدول الزمني للمشاريع لسكنية',
      locale: const Locale('ar'),
      theme: ThemeData(
        primaryColor: const Color(0xFF008B9A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF008B9A),
          primary: const Color(0xFF008B9A),
        ),
        useMaterial3: true,
        fontFamily: 'Almarai',
        scaffoldBackgroundColor: Colors.white,
        //unselectedWidgetColor: const Color(0xFF008B9A),
      ),
      home: const SeceduleOfResidentialProgectsApp(),
    );
  }
}
