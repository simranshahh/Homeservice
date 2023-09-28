// ignore_for_file: deprecated_member_use, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.grey,
            splashColor: Colors.black,
            textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.black),
              button: TextStyle(color: Colors.black),
            ),
            // accentColor: Colors.black,
            colorScheme: ColorScheme.light(
                primary: Colors.deepPurpleAccent,
                primaryVariant: Colors.black,
                secondaryVariant: Colors.black,
                onSecondary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.black,
                secondary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: DatePickerDialog(
            restorationId: 'date_picker_dialog',
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
            firstDate: DateTime(2021),
            lastDate: DateTime(2022),
          ),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        // ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 40,
        width: 120,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 90, 36, 165), //<-- SEE HERE
          ),
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: Text(
            ' ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
