
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
import 'package:skala_mobile/main_commons/main_size_data.dart';

class MainCustomDatePickerWidget extends StatefulWidget {
  const MainCustomDatePickerWidget({Key? key, this.label,}) : super(key: key);
  final String? label;
  @override
  State<MainCustomDatePickerWidget> createState() => _MainCustomDatePickerWidgetState();
}

class _MainCustomDatePickerWidgetState extends State<MainCustomDatePickerWidget> {
  DateTime? _dateTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MainSizeData.SIZE_12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label ?? '',
            style: const TextStyle(
                color: MainColorData.grey,
                fontSize: MainSizeData.SIZE_12,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: MainSizeData.SIZE_8),
          ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MainSizeData.SIZE_24),
                  side: BorderSide(
                      color: _dateTime == null
                          ? MainColorData.grey
                          : MainColorData.green_dop,
                      width: 1)),
              trailing: Icon(
                Icons.calendar_today,
                color: _dateTime == null ? MainColorData.grey : MainColorData.green_dop,
              ),
              title: _dateTime == null
                  ? Text(
                      'Select Date',
                      style: const TextStyle(
                          color: MainColorData.grey,
                          fontSize: MainSizeData.SIZE_12,
                          fontWeight: FontWeight.w400),
                    )
                  : Text(
                      '${_dateTime?.day}/${_dateTime?.month}/${_dateTime?.year}'),
              onTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                    currentDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    initialDatePickerMode: DatePickerMode.day,
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSwatch(
                          primarySwatch: Colors.blueGrey,
                          accentColor: MainColorData.green_dop,
                          backgroundColor: Colors.lightBlue,
                          cardColor: Colors.white,
                        )),
                        child: child!,
                      );
                    });
                if (date != null) {
                  setState(() {
                    _dateTime = date;
                  });
                }
              })
        ],
      ),
    );
  }
}