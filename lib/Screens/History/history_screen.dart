import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HistoryScreen extends StatefulWidget {
  /* PRIMARY KEY DATA */
  dynamic patient;

  /* CONSTRUCTOR METHOD */
  HistoryScreen(dynamic patient) {
    this.patient = patient;
  }

  /* CREATE STATE */
  @override
  State createState() {
    return _HistoryScreen(this.patient);
  }
}

class _HistoryScreen extends State<HistoryScreen> {
  /* PRIMARY KEY DATA */
  dynamic patient;

  /* IN-CLASS DATA */
  List<dynamic> treatmentList = [];
  Widget content = Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Text('ไม่พบประวัติการรักษา'),
  );

  /* CONSTRUCTOR METHOD */
  _HistoryScreen(dynamic patient) {
    this.patient = patient;
  }

  /* API CALLER METHOD */
  History() async {
    var response = await http.get(Uri.parse(
        "http://192.168.1.39/mudent-api/api/patient/treatment-desc?cid=${this.patient["CID"]}"));
    var data = jsonDecode(response.body);

    setState(() {
      this.treatmentList = data["data"];
      if (this.treatmentList.length > 0) {
        this.content = ListView.separated(
          padding: EdgeInsets.all(8),
          itemCount: this.treatmentList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Text(
                    "#${index + 1} ${this.treatmentList[index]["createdDate"]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none),
                  ),
                  Row(
                    children: [
                      Text(
                        this.treatmentList[index]["choice"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "(ทพ.${this.treatmentList[index]["dentist"]})",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      )
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        );
      } else {
        this.content = Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            'ไม่พบประวัติการรักษา',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none),
          ),
        );
      }
    });
  }

  /* USER INTERFACE */
  @override
  Widget build(BuildContext context) {
    History();
    return Container(
        decoration: BoxDecoration(color: Colors.white), child: this.content);
  }
}
