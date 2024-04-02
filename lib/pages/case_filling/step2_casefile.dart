import 'package:flutter/material.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key, this.restorationId});
  final String? restorationId;
  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;
  String dateChoosen = "Pick date";
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(1999, 7, 25));
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
  final List<String> gender = <String>[
    'Male',
    'Female',
    'Others',
  ];
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = gender.first;
    super.initState();
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          // initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(
            DateTime.now().year - 50,
          ),
          lastDate: DateTime.now(),
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
        dateChoosen =
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  String fromDate = "Pick Date";

  String toDate = "Pick Date";

  DateTime timeFrom = DateTime.now();

  DateTime timeTo = DateTime.now();

  Future<void> pickTime({required String forWhatTime}) async {
    final res = await showTimePicker(
      initialTime:
          TimeOfDay.fromDateTime(forWhatTime == "from" ? timeFrom : timeTo),
      context: context,
    );

    if (res != null) {
      if (forWhatTime == "from") {
        setState(() {
          final DateTime now = DateTime.now();
          timeFrom = now.copyWith(
              hour: res.hour,
              minute: res.minute,
              second: 0,
              millisecond: 0,
              microsecond: 0);
          if (timeFrom.isBefore(now)) {
            timeFrom = timeFrom.add(const Duration(days: 1));
          }
        });
      } else {
        setState(() {
          final DateTime now = DateTime.now();
          timeTo = now.copyWith(
              hour: res.hour,
              minute: res.minute,
              second: 0,
              millisecond: 0,
              microsecond: 0);
          if (timeTo.isBefore(now)) {
            timeTo = timeTo.add(const Duration(days: 1));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Offence Day :",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('From Date:'),
            ElevatedButton(
                onPressed: () {
                  _restorableDatePickerRouteFuture.present();
                  setState(() {});
                },
                child: Text(dateChoosen))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('To Date:'),
            ElevatedButton(
                onPressed: () {
                  _restorableDatePickerRouteFuture.present();
                  setState(() {});
                },
                child: Text(toDate))
          ],
        ),
        const Text(
          "Time Period :",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Time From:'),
            ElevatedButton(
                onPressed: () {
                  pickTime(forWhatTime: "from");
                },
                child: Text("${timeFrom.hour}:${timeFrom.minute}"))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Time To:'),
            ElevatedButton(
                onPressed: () {
                  pickTime(forWhatTime: "to");
                },
                child: Text("${timeTo.hour}:${timeTo.minute}"))
          ],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: DropdownMenu<String>(
              inputDecorationTheme: const InputDecorationTheme(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder()),
              initialSelection: gender.first,
              label: const Text('Gender'),
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  gender.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(
                  value: value,
                  label: value,
                );
              }).toList(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
              "Note :  The report will be verified and then it will be proceeded by nearby police station from your location."),
        ),
      ],
    );
  }
}
