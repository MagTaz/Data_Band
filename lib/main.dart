

import 'package:data_band/Screens/AddRequest.dart';
import 'package:data_band/Screens/EmployeeHomePage.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Utils/Routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/LoginPage.dart';
import 'Screens/TaskerHomePage.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, String newLocale) {
    _MyAppState? state = context.findRootAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}
class _MyAppState extends State<MyApp> {
  
  Color _primaryColor = Colors.blue;
  @override
  void initState()  {
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primaryColor = value;
      });
       });
    super.initState();
  }

  String _locale = "en";
  setLocale(String locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    setState(() {
      _primaryColor;
    });
    return MaterialApp(
      routes: Routs.routs,
      theme: ThemeData(primaryColor: _primaryColor,
      appBarTheme: AppBarTheme(color: _primaryColor)),
      locale: Locale(_locale),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: LoginPage()
      ,
    );
  }
}
