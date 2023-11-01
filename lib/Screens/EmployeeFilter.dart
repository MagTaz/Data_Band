import 'package:data_band/Utils/ButtonStyle.dart';
import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/Screens/Widgets/EmployeeListRequistesWidget.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Services/changeLanguage.dart';
import '../Utils/ColorsList.dart';

class EmployeeFilter extends StatefulWidget {
  const EmployeeFilter({super.key});

  @override
  State<EmployeeFilter> createState() => _EmployeeFilterState();
}

class _EmployeeFilterState extends State<EmployeeFilter> {
  Color _primaryColor = Colors.blue;
  Color _btm1 = Colors.blue;
  Color _btm2 = Colors.black38;
  Color _btm3 = Colors.black38;
  bool searched = false;
  String searchText = "";
  DateTime? fromDate;
  DateTime? toDate;
  String? dropdownValue;
  String title = "";

  @override
  void initState() {
    ChangeLanguage.getLanguage().then((value) {
      setState(() {
        dropdownValue;
      });
    });
    ColorsList.getPrimaryColor().then((value) {
      _primaryColor = value;
      _btm1 = value;
    });

    super.initState();
  }

  int Index = 0;
  @override
  Widget build(BuildContext context) {
    

    List<String> listOfStatus = [
      S.of(context).pending,
      S.of(context).progress,
      S.of(context).rejected,
      S.of(context).completed,
      S.of(context).canceled,
      S.of(context).open,
    ];
    List<String> listOfReported = [
      S.of(context).pending,
      S.of(context).progress,
      S.of(context).rejected,
    ];
    List<String> listOfAffected = [
      S.of(context).completed,
      S.of(context).canceled,
      S.of(context).open,
    ];

    List searchType = [listOfStatus, listOfReported, listOfAffected];
    setState(() {
      listOfStatus;
    });
    return SafeArea(
      child: Container(
        color: _primaryColor.withOpacity(0.7),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBar(_primaryColor, searchType[Index],
                title == "" ? S.of(context).status : title),
            
          ],
        ),
      ),
    );
  }

  Widget SearchBar(Color _color, List<String> list, String _title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 20, spreadRadius: 2)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15))),
      child: Column(
        children: [
          searchType(_color),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text(
                _title,
                style: Text_Style.textStyleBold(Colors.black, 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 1, blurRadius: 5)
                  ],
                  border: Border.all(
                    color: _primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: dropDownStatus(list, _title),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    S.of(context).from,
                    style: Text_Style.textStyleBold(Colors.black, 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DatePickerWidget(fromDate, 0),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context).to,
                    style: Text_Style.textStyleBold(Colors.black, 14),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DatePickerWidget(toDate, 1),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 35,
            child: ElevatedButton(
                style: Button_Style.buttonStyle(context, _color, 12),
                onPressed: () {
                  setState(() {
                    if (dropdownValue != null) {
                      searched = true;
                    searchText = dropdownValue!;
                    }
                    
                  });
                },
                child: Text(
                  S.of(context).search,
                  style: Text_Style.textStyleBold(Colors.white, 16),
                )),
          ),
        searched ? EmployeeListRequsistsWidget(searchText) : Container(),
        ],
      ),
    );
  }

  Row searchType(Color _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _btm1 = _color;
              _btm2 = Colors.black38;
              _btm3 = Colors.black38;
              Index = 0;
              title = S.of(context).status;
              dropdownValue = null;
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: _btm1))),
              child: Text(
                S.of(context).ByStatus,
                style: Text_Style.textStyleBold(Colors.black, 15),
              )),
        ),
        Container(
          height: 22,
          child: VerticalDivider(
            thickness: 2,
            color: Colors.black45,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _btm1 = Colors.black38;
              _btm2 = _color;
              _btm3 = Colors.black38;
              Index = 1;
              title = S.of(context).Reported;
              dropdownValue = null;
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: _btm2))),
              child: Text(
                S.of(context).ByReported,
                style: Text_Style.textStyleBold(Colors.black, 15),
              )),
        ),
        Container(
          height: 22,
          child: VerticalDivider(
            thickness: 2,
            color: Colors.black45,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _btm1 = Colors.black38;
              _btm2 = Colors.black38;
              _btm3 = _color;
              Index = 2;
              title = S.of(context).Affected;
              dropdownValue = null;
            });
          },
          child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: _btm3))),
              child: Text(
                S.of(context).ByAffected,
                style: Text_Style.textStyleBold(Colors.black, 15),
              )),
        ),
      ],
    );
  }

  Widget dropDownStatus(List<String> list, String _title) {
    return Container(
      width: 1000,
      child: DropdownButton<String>(
        isExpanded: true,
        value: dropdownValue,
        underline: Container(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        hint: Center(
          child: Text(
            _title,
            style: Text_Style.textStyleNormal(Colors.black38, 15),
            textAlign: TextAlign.center,
          ),
        ),
        onChanged: (var newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value.isEmpty
                ? Text(
                    _title,
                    style: Text_Style.textStyleNormal(Colors.black38, 15),
                    textAlign: TextAlign.center,
                  )
                : Center(
                  child: Text(
                      value,
                      style: Text_Style.textStyleNormal(_primaryColor, 15),
                      textAlign: TextAlign.center,
                    ),
                ),
          );
        }).toList(),
      ),
    );
  }

  _selectDate(DateTime? datetime, int index) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: datetime ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != datetime) {
      setState(() {
        datetime = pickedDate;
        index == 0 ? fromDate = datetime : toDate = datetime;
      });
    }
    return datetime;
  }

  DatePickerWidget(DateTime? datetime, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120,
          height: 30,
          child: ElevatedButton(
            style: Button_Style.buttonStyle(context, _primaryColor, 12),
            onPressed: () {
              _selectDate(datetime, index);
              setState(() {});
            },
            child: Text(
              index == 0
                  ? fromDate != null
                      ? '${DateFormat('dd - MM - yyyy').format(fromDate!)}'
                      : S.of(context).SelectDate
                  : toDate != null
                      ? '${DateFormat('dd - MM - yyyy').format(toDate!)}'
                      : S.of(context).SelectDate,
            ),
          ),
        ),
      ],
    );
  }
}
