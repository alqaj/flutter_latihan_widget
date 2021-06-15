
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nameController = TextEditingController();
  String fullName = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter - ITD Tutorial'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
                // Text Input Biasa dg Maxlength 25, Tanpa di perlihatkan counter
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 3),
                child: TextField(
                  maxLength: 25,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Lengkap',
                    counterText: "",
                  ),
                )),
            Container(
                // Text Input Biasa dg Maxlength 5, dengan di perlihatkan counter
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  maxLength: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Panggilan',
                  ),
                )),
            Container(
                // Text Input tanpa maxlength
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                  ),
                )),
            Container(
                // Text Input untuk Number Only
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usia',
                  ),
                )),
            Container(
                // Text Input untuk Number Only dengan disertai Min dan Max Value dengan memanfaatkan CustomRangeFormater
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CustomRangeTextInputFormatter(),
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jumlah Saudara (max 5)',
                  ),
                )),
                Container(
                  // Date Picker
                  margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                  child: BasicDateField(
                  )
                ),
                Container(
                  // Time Picker
                  margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                  child: BasicTimeField(
                  )
                ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text("Submit"),
                onPressed: () {
                  print(nameController.text);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            )
          ]))),
    );
  }
}

class CustomRangeTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '')
      return TextEditingValue();
    else if (int.parse(newValue.text) < 0)
      return TextEditingValue().copyWith(text: '0');

    return int.parse(newValue.text) > 5
        ? TextEditingValue().copyWith(text: '5')
        : newValue;
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      DateTimeField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Tanggal Lahir"
        ),
        format: format,
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      // Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
         decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Jam Lahir"
        ),
        onShowPicker: (context, currentValue) async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );
          return time == null ? null : DateTimeField.convert(time);
        },
      ),
    ]);
  }
}
