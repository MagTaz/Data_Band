// ignore_for_file: use_build_context_synchronously

import 'package:data_band/Api/ApiHandle.dart';
import 'package:data_band/Screens/EmployeeHomePage.dart';
import 'package:data_band/Screens/Widgets/ColorPickerWidget.dart';
import 'package:data_band/Screens/Widgets/ToastWidget.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Utils/Fonts.dart';
import 'package:data_band/Screens/Widgets/ChangeLanguageWidget.dart';
import 'package:data_band/Screens/Widgets/LoginAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../Utils/ButtonStyle.dart';
import '../Utils/TextFieldStyle.dart';
import '../Utils/TextStyle.dart';
import '../generated/l10n.dart';
import 'TaskerHomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    ColorsList.getPrimaryColor();

    super.initState();
  }

  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder<Color>(
          future: ColorsList.getPrimaryColor(),
          builder: (context, snapshot) {
            return Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                color: Colors.black12,
                child: Stack(
                  children: [
                    const LoginAnimation(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: snapshot.data,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        height: height * 2 / 3 + 5,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height * 2 / 3,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 3,
                                  color: Colors.black38,
                                  blurRadius: 30)
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                topLeft: Radius.circular(25)),
                            color: Colors.white),
                        child: Container(
                          padding: EdgeInsets.all(40),
                          height: height,
                          width: width,
                          child: Form(
                            key: formstate,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                      width: width / 4,
                                      child: Image.asset(
                                          "assets/Images/Logo.jpg")),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  emailTextField(snapshot.data ?? Colors.blue),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  passwordTextField(
                                      snapshot.data ?? Colors.blue),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton(
                                      style: Button_Style.buttonStyle(context,
                                          snapshot.data ?? Colors.blue, 12),
                                      onPressed: _isLoading == true
                                          ? null
                                          : () {
                                              setState(() {
                                                _isLoading = true;
                                              });

                                              submitLogin(emailController.text,
                                                  passwordController.text);
                                            },
                                      child: _isLoading == true
                                          ? Center(
                                              child: SpinKitThreeBounce(
                                                size: 30,
                                                color: snapshot.data,
                                              ),
                                            )
                                          : Text(
                                              S.of(context).Login,
                                              style: Text_Style.textBoldStyle,
                                            )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      setColorPicker(),
                                      Container(
                                          height: 30,
                                          width: 0,
                                          child: VerticalDivider(
                                            thickness: 1.5,
                                            width: 10,
                                            color: Colors.black38,
                                          )),
                                      ChangeLanguageWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }),
    );
  }

  TextFormField emailTextField(Color color) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).emptyEmail;
          }
          return null;
        },
        style: TextStyle(
          fontFamily: Fonts.PrimaryFont,
        ),
        enabled: !_isLoading,
        controller: emailController,
        obscureText: false,
        decoration: TextFieldStyle()
            .primaryTexrField(S.of(context).email, Icon(Icons.email), color));
  }

  TextFormField passwordTextField(Color color) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return S.of(context).emptypassword;
          }
          return null;
        },
        style: TextStyle(
          fontFamily: Fonts.PrimaryFont,
        ),
        enabled: !_isLoading,
        controller: passwordController,
        obscureText: true,
        decoration: TextFieldStyle()
            .primaryTexrField(S.of(context).password, Icon(Icons.lock), color));
  }

  Widget setColorPicker() {
    return FutureBuilder<Color>(
        future: ColorsList.getPrimaryColor(),
        builder: (context, snapshot) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), backgroundColor: snapshot.data),
              onPressed: () async {
                Color selectedColor = await ColorsList.getPrimaryColor();
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
              child: Container());
        });
  }

  submitLogin(String email, String password) async {
    if (formstate.currentState != null) {
      final formState = formstate.currentState;

      if (formState!.validate()) {
        await APIHandler.login(email.trim(), password.trim(), context);
        setState(() {
          _isLoading = false;
        });
      } else {
        print('Form is invalid');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

 }
