import 'dart:async';
import 'dart:io';
import 'package:data_band/Screens/Widgets/VideoPlayerWidget.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:data_band/Utils/ColorsList.dart';
import 'package:data_band/Utils/TextFieldStyle.dart';
import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import '../Utils/ButtonStyle.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

import 'Widgets/AudioPlayerWidget.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({super.key});

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  Color _primaryColor = Colors.blue;
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  bool isRecordPlay = false;
  String audioPath = "";
  int seconds = 0;
  int minutes = 0;
  Timer? timer;
  late int totalSeconds;
  late int displayMinutes;
  late int displaySeconds;
  List<File> selectedImages = [];
  List<File> selectedVideo = [];
  List<File> selectedFile = [];
  int maxImageCount = 5;
  bool _play = false;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    ColorsList.getPrimaryColor().then((value) {
      setState(() {
        _primaryColor = value;
      });
    });
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        seconds++;
        if (seconds >= 60) {
          seconds = 0;
          minutes++;
        }
      });
    });
  }

  Future<void> pickVideoGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedVideo = await _picker.pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVideo != null) {
      setState(() {
        selectedVideo = [];
        selectedVideo.add(File(pickedVideo.path));
      });
    }
  }

  Future<void> showVideoPickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Video'),
          content: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.photo,
                        color: _primaryColor,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "From Gallery",
                        style: Text_Style.textStyleBold(_primaryColor, 12),
                      )
                    ],
                  ),
                  onPressed: () {
                    pickVideoGallery();
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 16.0),
                TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: _primaryColor,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Take a Photo",
                        style: Text_Style.textStyleBold(_primaryColor, 12),
                      )
                    ],
                  ),
                  onPressed: () {
                    pickVideoCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickVideoCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedVideo = await _picker.pickVideo(
      source: ImageSource.camera,
    );

    if (pickedVideo != null) {
      setState(() {
        selectedVideo = [];
        selectedVideo.add(File(pickedVideo.path));
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    List<Asset> resultList = [];
    String error = '';

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: maxImageCount - selectedImages.length,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    if (resultList.isNotEmpty) {
      setState(() {
        for (var asset in resultList) {
          asset.getByteData().then((byteData) {
            if (byteData != "") {
              final buffer = byteData.buffer;
              final tempDirectory = Directory.systemTemp;
              final tempFileName = asset.name;
              final tempFilePath = '${tempDirectory.path}/$tempFileName';

              File(tempFilePath).writeAsBytes(buffer.asUint8List());
              setState(() {
                selectedImages.add(File(tempFilePath));
              });
            }
          });
        }
      });
    }

    if (error.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(error),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImages.add(File(pickedImage.path));
      });
    }
  }

  Future<void> showImagePickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick Image'),
          content: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.photo,
                        color: _primaryColor,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "From Gallery",
                        style: Text_Style.textStyleBold(_primaryColor, 12),
                      )
                    ],
                  ),
                  onPressed: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 16.0),
                TextButton(
                  child: Column(
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: _primaryColor,
                        size: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Take a Photo",
                        style: Text_Style.textStyleBold(_primaryColor, 12),
                      )
                    ],
                  ),
                  onPressed: () {
                    pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  Future<void> pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx'],
    );

    if (result != null) {
      setState(() {
        selectedFile = [];
        selectedFile.add(File(result.files.single.path.toString()));
      });
    }
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
    totalSeconds = (minutes * 60) + seconds;
    displayMinutes = totalSeconds ~/ 60;
    displaySeconds = (totalSeconds % 60);
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    audioPlayer.dispose();
    audioRecord.dispose();
    super.dispose();
  }

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        minutes = 0;
        seconds = 0;
        await audioRecord.start();
        setState(() {
          isRecording = true;
          startTimer();
        });
      }
    } catch (e) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
        stopTimer();
      });
    } catch (e) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
  }

  Future<void> playRecording() async {
    setState(() {
      isRecordPlay = true;
      Timer(Duration(seconds: totalSeconds), () {
        setState(() {
          isRecordPlay = false;
        });
      });
    });
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
  }

  Future<void> StopPlayingRecording() async {
    setState(() {
      isRecordPlay = false;
    });
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.stop();
    } catch (e) {
      print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$e>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
  }

  String? filePath;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget dropDownStatus(
        Icon icon, String title, List<String> list, bool required) {
      String? dropdownValue;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black, 19),
                ),
                required
                    ? Text(
                        " * ",
                        textAlign: TextAlign.center,
                        style: Text_Style.textStyleBold(Colors.red, 18),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _primaryColor.withOpacity(0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width,
              child: DropdownButton<String>(
                underline: Container(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                hint: Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black54, 15),
                ),
                isExpanded: true,
                value: dropdownValue,
                onChanged: (var newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(
                      value,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget dropDownBuilding(
        Icon icon, String title, List<String> list, bool required) {
      String? dropdownValue;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black, 19),
                ),
                required
                    ? Text(
                        " * ",
                        textAlign: TextAlign.center,
                        style: Text_Style.textStyleBold(Colors.red, 18),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _primaryColor.withOpacity(0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width,
              child: DropdownButton<String>(
                underline: Container(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                hint: Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black54, 15),
                ),
                isExpanded: true,
                value: dropdownValue,
                onChanged: (var newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(
                      value,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: _primaryColor.withOpacity(0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width / 3,
                  child: DropdownButton<String>(
                    underline: Container(),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    hint: Text(
                      S.of(context).AddRequest_Building_Floors,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                    isExpanded: true,
                    value: dropdownValue,
                    onChanged: (var newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(
                          value,
                          style: Text_Style.textStyleBold(Colors.black54, 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: _primaryColor.withOpacity(0.5),
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width / 3,
                  child: DropdownButton<String>(
                    underline: Container(),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    hint: Text(
                      S.of(context).AddRequest_Building_Units,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                    isExpanded: true,
                    value: dropdownValue,
                    onChanged: (var newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: value,
                        child: Text(
                          value,
                          style: Text_Style.textStyleBold(Colors.black54, 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _primaryColor.withOpacity(0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width,
              child: DropdownButton<String>(
                underline: Container(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                hint: Text(
                  S.of(context).AddRequest_Building_Rooms,
                  style: Text_Style.textStyleBold(Colors.black54, 15),
                ),
                isExpanded: true,
                value: dropdownValue,
                onChanged: (var newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(
                      value,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget dropDownClassify(
        Icon icon, String title, List<String> list, bool required) {
      String? dropdownValue;
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black, 19),
                ),
                required
                    ? Text(
                        " * ",
                        textAlign: TextAlign.center,
                        style: Text_Style.textStyleBold(Colors.red, 18),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _primaryColor.withOpacity(0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width,
              child: DropdownButton<String>(
                underline: Container(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                hint: Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black54, 15),
                ),
                isExpanded: true,
                value: dropdownValue,
                onChanged: (var newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(
                      value,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: _primaryColor.withOpacity(0.5),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: width,
              child: DropdownButton<String>(
                underline: Container(),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                hint: Text(
                  S.of(context).AddRequest_Classify_Summary,
                  style: Text_Style.textStyleBold(Colors.black54, 15),
                ),
                isExpanded: true,
                value: dropdownValue,
                onChanged: (var newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: Text(
                      value,
                      style: Text_Style.textStyleBold(Colors.black54, 15),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    }

    Widget requestDescription(Icon icon, String title, bool required) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 4,
                ),
                Text(
                  title,
                  style: Text_Style.textStyleBold(Colors.black, 19),
                ),
                required
                    ? Text(
                        " * ",
                        textAlign: TextAlign.center,
                        style: Text_Style.textStyleBold(Colors.red, 18),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: _primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: width,
                child: TextField(
                  maxLines: 5,
                  decoration: TextFieldStyle().DescriptionTexrField(
                      S.of(context).AddRequest_DescriptionHint, Colors.black45),
                )),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget Attachments() {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.attach_file),
                SizedBox(
                  width: 4,
                ),
                Text(
                  S.of(context).AddRequest_attachment,
                  style: Text_Style.textStyleBold(Colors.black, 19),
                ),
                Text(
                  " * ",
                  textAlign: TextAlign.center,
                  style: Text_Style.textStyleBold(Colors.red, 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  if (selectedImages.length >= 5) {
                    setState(() {
                      selectedImages = [];
                    });
                  } else {
                    showImagePickerDialog(context);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.2),
                      color: _primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width,
                  height: 40,
                  child: Row(
                    children: [
                      selectedImages.length >= 5
                          ? Icon(
                              Icons.delete,
                              color: Colors.red[800],
                            )
                          : Icon(
                              Icons.add_a_photo_outlined,
                              color: Colors.black,
                            ),
                      SizedBox(
                        width: 5,
                      ),
                      selectedImages.length >= 5
                          ? Row(
                              children: [
                                Text(
                                  "Delete All Images",
                                  style: Text_Style.textStyleBold(
                                      Colors.red[800] as Color, 17),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Text(
                                  "${S.of(context).AddRequest_attachment_AddPhotos}",
                                  style: Text_Style.textStyleBold(
                                      Colors.black, 17),
                                ),
                                selectedImages.length != 0
                                    ? Text(
                                        "(${selectedImages.length} / 5)",
                                        style: Text_Style.textStyleNormal(
                                            Colors.black54, 15),
                                      )
                                    : Container()
                              ],
                            ),
                    ],
                  ),
                )),
            selectedImages.length != 0
                ? Container(
                    width: width,
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: selectedImages.length,
                        itemBuilder: (context, index) {
                          if (selectedImages.length == 0) {
                            return null;
                          } else {
                            return Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 120,
                                      height: height,
                                      child: Image.file(
                                        selectedImages[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    (selectedImages.length < 5 &&
                                            index == selectedImages.length - 1)
                                        ? TextButton(
                                            onPressed: () {
                                              showImagePickerDialog(context);
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black87,
                                            ))
                                        : Container()
                                  ],
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedImages
                                          .remove(selectedImages[index]);
                                    });
                                  },
                                ),
                              ],
                            );
                          }
                        }),
                  )
                : Container(),
            TextButton(
                onPressed: () {
                  showVideoPickerDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.2),
                      color: _primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width,
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.video_call_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).AddRequest_attachment_AddVideo,
                        style: Text_Style.textStyleBold(Colors.black, 17),
                      ),
                    ],
                  ),
                )),
            selectedVideo.length == 0
                ? Container()
                : Container(
                  child: Stack(
                    children: [
                      Container(
                        height: 400,
                        child: Center(
                          child: VideoPlayerWidget(file: selectedVideo[0],play: _play,),
                        ),
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           IconButton(onPressed: (){
                             setState(() {
                               selectedVideo =[];
                             });
                           }, icon: Icon(Icons.delete ,color: Colors.red[800],size: 30,)),
                         ],
                       ),
                      
                    ],
                  ),
                ),
            TextButton(
                onPressed: () {
                  isRecording ? stopRecording() : startRecording();
                  
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.2),
                      color: _primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width,
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_voice_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      isRecording
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${S.of(context).AddRequest_attachment_VoiceRecord_recording}...",
                                  style: Text_Style.textStyleBold(
                                      Colors.red[800] as Color, 17),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                                  style: Text_Style.textStyleNormal(
                                      Colors.black38, 17),
                                ),
                              ],
                            )
                          : Text(
                              S.of(context).AddRequest_attachment_VoiceRecord,
                              style: Text_Style.textStyleBold(Colors.black, 17),
                            ),
                      Spacer(),
                      isRecording
                          ? Icon(
                              Icons.circle,
                              color: Colors.red[800],
                            )
                          : Container()
                    ],
                  ),
                )),
           ( !isRecording && audioPath != "")
           ?Container(
            height: 200,
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      audioPath = "";
                    });
                  }, icon: Icon(Icons.delete ,color: Colors.red[800],size: 25,)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AudioPlayerWidget(path: audioPath , color: _primaryColor,))]),)
           :Container(),
             TextButton(
                onPressed: () {
                  pickDocument();
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.2),
                      color: _primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: width,
                  height: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        S.of(context).AddRequest_attachment_Documents,
                        style: Text_Style.textStyleBold(Colors.black, 17),
                      ),
                    ],
                  ),
                )),
            selectedFile.length == 0
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        color: _primaryColor,
                      ),
                      Text(selectedFile[0].path.split('/').last),
                      Icon(Icons.check, color: Colors.green,)
                    ],
                  ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_primaryColor, _primaryColor.withOpacity(0.7)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Add Request",
                    style: Text_Style.textStyleBold(
                        Colors.white.withOpacity(0.8), 30),
                  )),
              Expanded(
                child: Container(
                  width: width,
                  height: height,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 5))
                      ],
                      color: Colors.white),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        dropDownStatus(
                            Icon(Icons.person),
                            S.of(context).AddRequest_AffectedUser,
                            ["Option 1 ", "Option 2"],
                            true),
                        dropDownStatus(
                            Icon(Icons.location_on_outlined),
                            S.of(context).AddRequest_LocationZone,
                            ["Option 1 ", "Option 2"],
                            true),
                        dropDownBuilding(
                            Icon(Icons.business_outlined),
                            S.of(context).AddRequest_Building,
                            ["Option 1 ", "Option 2"],
                            true),
                        dropDownStatus(
                            Icon(Icons.home_work_rounded),
                            S.of(context).AddRequest_Assets,
                            ["Option 1 ", "Option 2"],
                            true),
                        dropDownClassify(
                            Icon(Icons.category_outlined),
                            S.of(context).AddRequest_Classify,
                            ["Option 1 ", "Option 2"],
                            false),
                        requestDescription(Icon(Icons.library_books),
                            S.of(context).AddRequest_RequestDescription, false),
                        Attachments(),
                        ElevatedButton(
                            style: Button_Style.buttonStyle(
                                context, _primaryColor, 0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.save,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  S.of(context).AddRequest_SubmitButton,
                                  style: Text_Style.textStyleBold(
                                      Colors.white, 20),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
