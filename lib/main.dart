import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 3),
                child: TextField(
                  maxLength: 25,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Lengkap',
                    counterText: "",
                  ),
                )),
                Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  maxLength: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Panggilan',
                    counterText: "",
                  ),
                )),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat',
                  ),
                )),
                 Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usia',
                  ),
                )),
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
