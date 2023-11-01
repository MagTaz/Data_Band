import 'package:data_band/Utils/ButtonStyle.dart';

import 'package:data_band/Utils/TextStyle.dart';
import 'package:data_band/Screens/Widgets/EmployeeListRequistesWidget.dart';
import 'package:data_band/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Services/changeLanguage.dart';
import '../Utils/ColorsList.dart';

class TaskerFilter extends StatefulWidget {
  const TaskerFilter({super.key});

  @override
  State<TaskerFilter> createState() => _TaskerFilterState();
}

class _TaskerFilterState extends State<TaskerFilter> {
  Color _primaryColor = Colors.blue;
  Color _btm1 = Colors.blue;
  bool searched = false;
  String searchText = "";
  DateTime? fromDate;
  DateTime? toDate;
  String? dropdownValue;

  @override
  void initState() {
    ChangeLanguage.getLanguage().then((value) {
      setState(() {
        dropdownValue = S.of(context).pending;
      });
    });
    ColorsList.getPrimaryColor().then((value) {
      _primaryColor = value;
      _btm1 = value;
    });

    super.initState();
  }

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
    setState(() {
      listOfStatus;
    });
    return SafeArea(
      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBar(_primaryColor, listOfStatus),
            searched ? EmployeeListRequsistsWidget(searchText) : Container(),
          ],
        ),
      ),
    );
  }

  Widget SearchBar(Color _color, List<String> list) {
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
                S.of(context).status,
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
                child: dropDownStatus(list),
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
                  SizedBox(height: 5,),
                  DatePickerWidget(fromDate, 0),
                ],
              ),
              Column(
                children: [
                  Text(
                    S.of(context).to,
                    style: Text_Style.textStyleBold(Colors.black, 14),
                  ),
                  SizedBox(height: 5,),
                  DatePickerWidget(toDate, 1),
                ],
              ),
            ],
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: 20),
          //     height: 40,
          //     child: TextFormField(
          //       controller: _searchController,
          //       decoration: TextFieldStyle().primaryTexrField(
          //           S.of(context).search, Icon(Icons.search), _color),
          //     )),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 35,
            child: ElevatedButton(
                style: Button_Style.buttonStyle(context, _color , 12),
                onPressed: () {
                  setState(() {
                    searched = true;
                    searchText = dropdownValue!;
                  });
                },
                child: Text(
                  S.of(context).search,
                  style: Text_Style.textStyleBold(Colors.white, 16),
                )),
          )
        ],
      ),
    );
  }

  Widget searchType(Color _color) {
    return Container(
      width: 500,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: _btm1))),
        child: Text(
          S.of(context).Tasker_Filter_Page,
          textAlign: TextAlign.center,
          style: Text_Style.textStyleBold(Colors.black, 20),
        ));
  }

  DropdownButton<String> dropDownStatus(List<String> list) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (var newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
            style: Button_Style.buttonStyle(context, _primaryColor , 12),
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
