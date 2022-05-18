import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:http/http.dart' as http;

class EditProfilePage extends StatefulWidget {
  /* PRIMARY KEY DATA */
  dynamic patient;

  /* CONSTRUCTOR METHOD */
  EditProfilePage(dynamic patient) {
    this.patient = patient;
  }

  @override
  _EditProfilePageState createState() => _EditProfilePageState(this.patient);
}

class _EditProfilePageState extends State<EditProfilePage> {
  /* PRIMARY KEY DATA */
  dynamic patient;

  /* STATE DATA */
  List<dynamic> dentistList = [];
  List<dynamic> appointmentList = [];
  String currentDentist = '';
  String dateBtn = 'กรุณาเลือกทันตแพทย์ก่อน';

  /* DROPDOWN DATA */
  dynamic dropdownValue = null;
  Icon dropdownIcon = null;

  /* DATETIME DATA */
  DateTime date;

  /* LISTENER DATA */
  Function firstListener = null;        // 09:00
  Function secondListener = null;       // 09:30
  Function thirdListener = null;        // 10:00
  Function fourthListener = null;       // 10:30

  Function fifthListener = null;        // 11:00
  Function sixthListener = null;        // 11:30
  Function seventhListener = null;      // 12:00
  Function eighthListener = null;       // 12:30

  Function ninthListener = null;        // 13:00
  Function tenthListener = null;        // 13:30
  Function eleventhListener = null;     // 14:00
  Function twelfthListener = null;      // 14:30

  Function thirteenthListener = null;   // 15:00
  Function fourteenthListener = null;   // 15:30
  Function fifteenthListener = null;    // 16:00
  Function sixteenthListener = null;    // 16:30

  Function seventeenthListener = null;  // 17:00


  /* CONSTRUCTOR METHOD */
  _EditProfilePageState(dynamic patient) {
    this.patient = patient;
  }

  /* API CALLER METHOD */
  initDoctorList() async {
    var response = await http.get(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/all'));
    var data = jsonDecode(response.body);

    setState(() {
      this.dentistList = data['data'] as List<dynamic>;
      this.dropdownIcon = const Icon(Icons.arrow_downward);
    });
  }

  getAppointment(String dentist) async {
    var response = await http.get(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment?user=${dentist}'));
    var data = jsonDecode(response.body);

    setState(() {
      this.appointmentList = data['data'];
      this.currentDentist = dentist;

      this.date = DateTime.now();
      this.dateBtn = this.formatDateString(DateTime.now());
      this.enableListener();
      this.checkListener(this.appointmentList);
    });
  }

  /* DATETIME PICKER */
  selectDate(BuildContext context) async {
    final DateTime dt = await showDatePicker(
        context: context,
        initialDate: this.date,
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 2, DateTime.now().month, DateTime.now().day)
    );
    if (dt != null) {
      setState(() {
        this.date = dt;
        this.dateBtn = this.formatDateString(dt);
        this.enableListener();
        this.checkListener(this.appointmentList);
      });
    }
  }

  /* ENABLE & DISABLE LISTENER FUNCTION */
  enableListener() {
    setState(() {
      this.firstListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 9, 0, 0).toString()
        });

        setState(() {
          this.firstListener = null;
        });
      };
      this.secondListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 9, 30, 0).toString()
        });

        setState(() {
          this.secondListener = null;
        });
      };
      this.thirdListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 10, 0, 0).toString()
        });

        setState(() {
          this.thirdListener = null;
        });
      };
      this.fourthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 10, 30, 0).toString()
        });

        setState(() {
          this.fourthListener = null;
        });
      };
      this.fifthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 11, 0, 0).toString()
        });

        setState(() {
          this.fifthListener = null;
        });
      };
      this.sixthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 11, 30, 0).toString()
        });

        setState(() {
          this.sixthListener = null;
        });
      };
      this.seventhListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 12, 0, 0).toString()
        });

        setState(() {
          this.seventhListener = null;
        });
      };
      this.eighthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 12, 30, 0).toString()
        });

        setState(() {
          this.eighthListener = null;
        });
      };
      this.ninthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 13, 0, 0).toString()
        });

        setState(() {
          this.ninthListener = null;
        });
      };
      this.tenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 13, 30, 0).toString()
        });

        setState(() {
          this.tenthListener = null;
        });
      };
      this.eleventhListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 14, 0, 0).toString()
        });

        setState(() {
          this.eleventhListener = null;
        });
      };
      this.twelfthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 14, 30, 0).toString()
        });

        setState(() {
          this.twelfthListener = null;
        });
      };
      this.thirteenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 15, 0, 0).toString()
        });

        setState(() {
          this.thirteenthListener = null;
        });
      };
      this.fourteenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 15, 30, 0).toString()
        });

        setState(() {
          this.fourteenthListener = null;
        });
      };
      this.fifteenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 16, 0, 0).toString()
        });

        setState(() {
          this.fifteenthListener = null;
        });
      };
      this.sixteenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 16, 30, 0).toString()
        });

        setState(() {
          this.sixteenthListener = null;
        });
      };

      this.seventeenthListener = () {
        http.post(Uri.parse('http://192.168.1.39/mudent-api/api/doctor/appointment'), body: {
          'username': this.currentDentist,
          'cid': this.patient['CID'],
          'dateTime': DateTime(this.date.year, this.date.month, this.date.day, 17, 0, 0).toString()
        });

        setState(() {
          this.seventeenthListener = null;
        });
      };
    });
  }

  disableListener() {
    setState(() {
      this.firstListener = null;
      this.secondListener = null;
      this.thirdListener = null;
      this.fourthListener = null;
      this.fifthListener = null;
      this.sixthListener = null;
      this.seventhListener = null;
      this.eighthListener = null;
      this.ninthListener = null;
      this.tenthListener = null;
      this.eleventhListener = null;
      this.twelfthListener = null;
      this.thirteenthListener = null;
      this.fourteenthListener = null;
      this.fifteenthListener = null;
      this.sixteenthListener = null;
      this.seventeenthListener = null;
    });
  }

  checkListener(List<dynamic> list) {
    for (int i = 0; i < list.length; i++) {
      if (list[i]['dateTime'][0] != this.formatDateString(this.date)) break;

      if (list[i]['dateTime'][1] == '09:00') {
        this.firstListener = null;
      }
      if (list[i]['dateTime'][1] == '09:30') {
        this.secondListener = null;
      }
      if (list[i]['dateTime'][1] == '10:00') {
        this.thirdListener = null;
      }
      if (list[i]['dateTime'][1] == '10:30') {
        this.fourthListener = null;
      }
      if (list[i]['dateTime'][1] == '11:00') {
        this.fifthListener = null;
      }
      if (list[i]['dateTime'][1] == '11:30') {
        this.sixthListener = null;
      }
      if (list[i]['dateTime'][1] == '12:00') {
        this.seventhListener = null;
      }
      if (list[i]['dateTime'][1] == '12:30') {
        this.eighthListener = null;
      }
      if (list[i]['dateTime'][1] == '13:00') {
        this.ninthListener = null;
      }
      if (list[i]['dateTime'][1] == '13:30') {
        this.tenthListener = null;
      }
      if (list[i]['dateTime'][1] == '14:00') {
        this.eleventhListener = null;
      }
      if (list[i]['dateTime'][1] == '14:30') {
        this.twelfthListener = null;
      }
      if (list[i]['dateTime'][1] == '15:00') {
        this.thirteenthListener = null;
      }
      if (list[i]['dateTime'][1] == '15:30') {
        this.fourteenthListener = null;
      }
      if (list[i]['dateTime'][1] == '16:00') {
        this.fifteenthListener = null;
      }
      if (list[i]['dateTime'][1] == '16:30') {
        this.sixteenthListener = null;
      }
      if (list[i]['dateTime'][1] == '17:00') {
        this.seventeenthListener = null;
      }
    }
  }

  /* UTILITY FUNCTION */
  String formatDateString(DateTime dt) {
    String year = dt.year.toString();
    String month = this.twoDigit(dt.month);
    String date = this.twoDigit(dt.day);
    String hour = this.twoDigit(dt.hour);
    String minute = this.twoDigit(dt.minute);

    String datePart = date + "/" + month + "/" + year;
    String timePart = hour + ":" + minute;

    return datePart;
  }

  String twoDigit(int num) =>  num < 10 ? "0" + num.toString() : num.toString();

  /* USER INTERFACE */
  @override
  Widget build(BuildContext context) {
    initDoctorList();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: GestureDetector(
          child: ListView(
            children: [
              Image.asset(
                'assets/images/mudent.png',
                alignment: Alignment.center,
                height: 80,
                width: MediaQuery.of(context).size.width,
              ),
              new Text(
                "นัดหมาย",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(102, 66, 129, 1),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),

              /* DROPDOWN USER INTERFACE */
              DropdownButton<dynamic>(
                value: dropdownValue,
                icon: this.dropdownIcon,
                elevation: 16,
                alignment: Alignment(0.0, 0.0),
                style: const TextStyle(color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (dynamic newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  this.getAppointment(newValue);
                },
                items: this
                    .dentistList
                    .map<DropdownMenuItem<dynamic>>((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                      value: value['username'],
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Text(
                          'ทพ.' + value['fullname'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30
                          ),
                        ),
                      ));
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),

              /* DATEPICKER BUTTON */
              ElevatedButton(
                  onPressed: () {
                    if (this.currentDentist == '') return;
                    selectDate(context);
                  },
                  child: Text(
                    this.dateBtn,
                    style: TextStyle(
                      fontSize: 25
                    ),
                  ),
              ),

              /* 09:00 SLOT */
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black87,
                  ),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    Text(
                      '09:00',
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                    ElevatedButton(
                        onPressed: this.firstListener,
                        child: Text('จอง'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          elevation: 5,
                          minimumSize: Size(300, 40)
                        )
                    )
                  ],
                )
              ),

              /* 09:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '09:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.secondListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),

              /* 10:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '10:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.thirdListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),

              /* 10:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '10:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.fourthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 11:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '11:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.fifthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 11:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '11:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.sixthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 12:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '12:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.seventhListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 12:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '12:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.eighthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 13:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '13:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.ninthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 13:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '13:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.tenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 14:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '14:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.eleventhListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 14:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '14:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.twelfthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 15:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '15:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.thirteenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 15:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '15:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.fourteenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 16:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '16:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.fifteenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 16:30 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '16:30',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.sixteenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
              /* 17:00 SLOT */
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Text(
                        '17:00',
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                      ElevatedButton(
                          onPressed: this.seventeenthListener,
                          child: Text('จอง'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 5,
                              minimumSize: Size(300, 40)
                          )
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
