import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class DDay extends StatefulWidget {
  const DDay({super.key});

  @override
  State<DDay> createState() => _DDayState();
}

class _DDayState extends State<DDay> {
  late DateTime firstDay = DateTime.now();
  late DateTime now = DateTime.now();
  late String ourFirstDay = '';
  late String dDayCount = '';
  late SharedPreferences savedFirstDay;
  String? firstDayTimeStamp;

  Future initFirstDay() async {
    savedFirstDay = await SharedPreferences.getInstance();
    firstDayTimeStamp = savedFirstDay.getString('timeStampKey');
    if (firstDayTimeStamp != null) {
      firstDay = DateTime.parse(firstDayTimeStamp!);
    } else {
      await savedFirstDay.setString(
          'timeStampKey', DateTime.now().toIso8601String());
      firstDay = DateTime.now();
    }
    setState(() {
      ourFirstDay = '${firstDay.year}.${firstDay.month}.${firstDay.day}';
      dDayCount =
          'D+${(DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1).abs()}';
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      now = DateTime.now();
    });
    initFirstDay();
  }

  void onHeartPressed() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color(0xffffffff),
            height: MediaQuery.of(context).size.height * 0.3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              maximumDate: now,
              initialDateTime: firstDay,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  firstDay = date;
                  savedFirstDay.setString(
                      'timeStampKey', date.toIso8601String());
                });
              },
            ),
          ),
        );
      },
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    initFirstDay();
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          'U&I',
          style: textTheme.headline1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.018,
        ),
        Text(
          '우리 처음 만난 날',
          style: textTheme.bodyText1,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Text(
          ourFirstDay,
          style: textTheme.bodyText2,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.018,
        ),
        IconButton(
          onPressed: onHeartPressed,
          icon: const Icon(
            Icons.favorite_rounded,
            color: Color(0xffe3242b),
          ),
          iconSize: 60,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.006,
        ),
        Text(
          dDayCount,
          style: textTheme.headline2,
        ),
      ],
    );
  }
}
