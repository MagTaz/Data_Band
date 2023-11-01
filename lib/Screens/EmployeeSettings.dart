import 'package:data_band/Services/AuthManger.dart';
import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../Services/changeLanguage.dart';
import '../Utils/ColorsList.dart';
import '../main.dart';

class EmployeeSettings extends StatefulWidget {
  const EmployeeSettings({super.key});

  @override
  State<EmployeeSettings> createState() => EmployeeSettingsState();
}

class EmployeeSettingsState extends State<EmployeeSettings> {
 static Color _primaryColor = Colors.blue;
  String _LanguageCode = "en";

  @override
  void initState() {
    ChangeLanguage.getLanguage().then((value) {
      setState(() {
        _LanguageCode == value;
      });
    });
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primaryColor = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _LanguageCode;
    });
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    List<Widget> ListOfSettings = [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          width: width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.language,
                color: _primaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).change_language,
                style: Text_Style.textStyle,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
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
                  icon: Icon(
                    Icons.change_circle_outlined,
                    size: 25,
                    color: _primaryColor,
                  ))
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          width: width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.vpn_key,
                color: _primaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).change_password,
                style: Text_Style.textStyle,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: _primaryColor,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          width: width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.colorize,
                color: _primaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).change_color,
                style: Text_Style.textStyle,
              ),
              Spacer(),
              setColorPicker()
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          width: width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info,
                color: _primaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).SettingsPage_AboutUs,
                style: Text_Style.textStyle,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: _primaryColor,
                ),
                onPressed: () {},
              )
            
            ],
          ),
        ),
      
      ),
    
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 70,
          width: width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black45)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: _primaryColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                S.of(context).sign_out,
                style: Text_Style.textStyle,
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: _primaryColor,
                ),
                onPressed: () {
                  AuthManager.logout();
                  Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/LoginPage',
                  (route) => false,
                );
                },
              )
            
            ],
          ),
        ),
      
      ),
    
    ];

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: _primaryColor,
        child: Column(
          children: [
            Container(
                width: width,
                padding: EdgeInsets.all(20),
                height: height / 5,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, _primaryColor]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(-20, 0),
                          color: Colors.black38,
                          spreadRadius: 0.02,
                          blurRadius: 15)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Barakat",
                      style: Text_Style.textBoldStyle,
                    ),
                    Text("test@gmail.com")
                  ],
                )),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0.02,
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: ListOfSettings.length,
                      itemBuilder: (context, index) {
                        return ListOfSettings[index];
                      })),
            )
          ],
        ),
      ),
    );
  }

  Widget setColorPicker() {
    return Container(
      width: 20,
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(), backgroundColor: _primaryColor),
          onPressed: () async {
            Color selectedColor = await ColorsList.getPrimaryColor();
            // ignore: use_build_context_synchronously
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select a color'),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          ColorPicker(
                            pickerColor: selectedColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            pickerAreaHeightPercent: 0.8,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  ColorsList.setPrimaryColor(selectedColor);
                                  _primaryColor = selectedColor;
                                  ColorsList.getPrimaryColor();
                                  Navigator.pop(context);
                                  
                                });
                              },
                              child: Text("Select"))
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container()),
    );
  }
  
  
}
