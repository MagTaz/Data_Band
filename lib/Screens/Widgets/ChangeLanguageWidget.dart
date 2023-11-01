
import 'package:flutter/material.dart';

import '../../Services/changeLanguage.dart';
import '../../main.dart';

class ChangeLanguageWidget extends StatefulWidget {
  const ChangeLanguageWidget({super.key});

  @override
  State<ChangeLanguageWidget> createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
 String _LanguageCode = "en";
  @override
  void initState() {
    ChangeLanguage.getLanguage().then((value) {
      setState(() {
        _LanguageCode == value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
          return Positioned(
            top: 20,
            right: 12,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  if (_LanguageCode == "ar") {
                    ChangeLanguage.setLanguage("en");
                    setState(() {
                      _LanguageCode = "en";
                    });
                    MyApp.setLocale(context, _LanguageCode);
                  } else {
                   ChangeLanguage.setLanguage("ar");
                   setState(() {
                      _LanguageCode = "ar";
                    });
                    MyApp.setLocale(context, _LanguageCode);
                  }
                },
                child: CircleAvatar(
                  radius: 18,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage:
                        AssetImage("assets/Images/$_LanguageCode.png"),
                  ),
                  backgroundColor: Colors.black87,
                ),
              ),
            ),
          );
        }
  }

