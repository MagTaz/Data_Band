import 'package:data_band/Utils/ColorsList.dart';
import 'package:flutter/material.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class ColorPickerWidget extends StatefulWidget {
  

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
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

  }
 
